# scripts/run_pipeline.py
#
# This single script orchestrates the entire data generation pipeline,
# combining all 5 steps into one command.
#
# Usage:
#   python -m scripts.run_pipeline
#
# To resume a partial run:
#   python -m scripts.run_pipeline --resume
#

import json
import asyncio
import sys
import argparse
import hashlib
from pathlib import Path
from typing import Set

# --- 1. Add project root to path ---
project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

# --- 2. Consolidate all imports from all 5 scripts ---
from lean_verifier.config import settings
from lean_verifier.theorem_prover import (
    extract_identifiers_from_text, 
    classify_identifiers,
    select_theorems_from_text
)
from lean_verifier.mutation_generator import (
    generate_similar_theorem_mutation_for_record, 
    RATE_LIMIT
)
from lean_verifier.annotation_generator import annotate_proofs
from lean_interact import LeanREPLConfig, TempRequireProject
from aiolimiter import AsyncLimiter

# --- 3. Copy helper functions from original scripts ---

# Helper from create_incorrect_proofs.py
def load_processed_keys(output_file: Path) -> Set[tuple]:
    """Reads an existing output file to find which records have been processed."""
    processed = set()
    if not output_file.exists():
        return processed
    with output_file.open('r', encoding='utf-8') as f:
        for line in f:
            try:
                data = json.loads(line)
                key = (data.get('path'), data.get('src_hash'), data.get('theorem'))
                if all(key):
                    processed.add(key)
            except (json.JSONDecodeError, KeyError):
                continue
    return processed

# Helper from annotate_proofs.py
def load_processed_hashes(annotated_file: Path, excluded_file: Path) -> Set[str]:
    """
    Reads both output files and returns a set of SHA1 hashes
    of the 'incorrect_proof' text for all processed records.
    """
    processed_hashes = set()
    def get_hash(text: str) -> str:
        return hashlib.sha1(text.encode('utf-8')).hexdigest()

    for file_path in [annotated_file, excluded_file]:
        if file_path.exists():
            with file_path.open('r', encoding='utf-8') as f:
                for line in f:
                    try:
                        data = json.loads(line)
                        if 'incorrect_proof' in data:
                            processed_hashes.add(get_hash(data['incorrect_proof']))
                    except (json.JSONDecodeError, KeyError):
                        continue
    return processed_hashes

# --- 4. Copy and adapt main functions from all 5 scripts ---

def run_step_1_build_cache():
    """
    Original logic from build_theorem_cache.py
    """
    print("\n--- [Step 1] Build Theorem Cache ---")

    if not settings.pass_output_file.exists():
        print(f"Error: Input file not found at '{settings.pass_output_file}'.")
        print("Please run the 'filter_files.py' script first.")
        return False

    print(f"Reading successful files from {settings.pass_output_file}...")
    all_identifiers = set()
    with settings.pass_output_file.open('r', encoding='utf-8') as f:
        for line in f:
            data = json.loads(line)
            if 'text' in data:
                identifiers = extract_identifiers_from_text(data['text'])
                all_identifiers.update(identifiers)
    
    print(f"Found {len(all_identifiers)} unique identifiers.")

    existing_cache = {}
    if settings.theorem_cache_file.exists():
        print(f"Loading existing cache from {settings.theorem_cache_file}...")
        existing_cache = json.loads(settings.theorem_cache_file.read_text(encoding='utf-8'))
        print(f"Found {len(existing_cache)} identifiers in cache.")
        
    unknown_identifiers = sorted([i for i in all_identifiers if i not in existing_cache])

    if not unknown_identifiers:
        print("No new identifiers to classify. Cache is up to date.")
        return True
        
    print(f"Found {len(unknown_identifiers)} new identifiers to classify.")

    print("\nInitializing Lean environment...")
    config = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))
    newly_classified_ids = classify_identifiers(config, unknown_identifiers)
    
    print("\nUpdating and saving the theorem cache...")
    existing_cache.update(newly_classified_ids)
    
    with settings.theorem_cache_file.open('w', encoding='utf-8') as f:
        json.dump(existing_cache, f, indent=2, sort_keys=True)
        
    print(f"Cache updated with {len(newly_classified_ids)} new entries.")
    print(f"Total cached identifiers: {len(existing_cache)}.")
    print("--- [Step 1] Complete ---")
    return True

def run_step_2_create_pairs():
    """
    Original logic from create_theorem_pairs.py
    """
    print("\n--- [Step 2] Create Theorem Pairs ---")

    if not settings.pass_output_file.exists():
        print(f"Error: Input file not found at '{settings.pass_output_file}'.")
        return False
        
    if not settings.theorem_cache_file.exists():
        print(f"Error: Theorem cache not found at '{settings.theorem_cache_file}'.")
        print("Please run Step 1 (build_theorem_cache) first.")
        return False

    print(f"Loading theorem cache from {settings.theorem_cache_file}...")
    with settings.theorem_cache_file.open('r', encoding='utf-8') as f:
        theorem_cache = json.load(f)
    print(f"Loaded {len(theorem_cache)} entries from cache.")

    print(f"Processing successful files from {settings.pass_output_file}...")
    lines_written = 0
    with settings.pass_output_file.open('r', encoding='utf-8') as infile, \
         settings.theorem_pairs_file.open('w', encoding='utf-8') as outfile:
        
        for line in infile:
            data = json.loads(line)
            theorem_ids = select_theorems_from_text(data['text'], theorem_cache)
            
            if theorem_ids:
                output_record = {
                    "path": data["path"],
                    "text": data["text"],
                    "src_hash": data["src_hash"],
                    "ids": theorem_ids 
                }
                outfile.write(json.dumps(output_record, ensure_ascii=False) + '\n')
                lines_written += 1

    print(f"\nSuccess! Wrote {lines_written} theorem pairs to {settings.theorem_pairs_file}.")
    print("--- [Step 2] Complete ---")
    return True

def run_step_3_expand_pairs():
    """
    Original logic from expand_theorem_pairs.py
    """
    print("\n--- [Step 3] Expand Theorem Pairs ---")

    if not settings.theorem_pairs_file.exists():
        print(f"Error: Input file not found at '{settings.theorem_pairs_file}'.")
        print("Please run Step 2 (create_theorem_pairs) first.")
        return False

    print(f"Reading theorem pairs from {settings.theorem_pairs_file}...")
    input_lines = 0
    output_lines = 0
    with settings.theorem_pairs_file.open('r', encoding='utf-8') as infile, \
         settings.expanded_pairs_file.open('w', encoding='utf-8') as outfile:
        
        for line in infile:
            input_lines += 1
            data = json.loads(line)
            theorem_ids = data.get("ids", [])
            
            for theorem_id in theorem_ids:
                output_record = {
                    "path": data["path"],
                    "text": data["text"],
                    "src_hash": data["src_hash"],
                    "theorem": theorem_id
                }
                outfile.write(json.dumps(output_record, ensure_ascii=False) + '\n')
                output_lines += 1

    print(f"\nProcessed {input_lines} input files.")
    print(f"Success. Wrote {output_lines} expanded theorem records to {settings.expanded_pairs_file}.")
    print("--- [Step 3] Complete ---")
    return True

async def run_step_4_create_incorrect(args: argparse.Namespace):
    """
    Original logic from create_incorrect_proofs.py
    """
    print("\n--- [Step 4] Create Incorrect Proofs (Async) ---")

    if not settings.expanded_pairs_file.exists():
        print(f"Error: Input file not found at '{settings.expanded_pairs_file}'.")
        print("Please run Step 3 (expand_theorem_pairs) first.")
        return False

    api_key = settings.api_keys.get("lean_explore")
    if not api_key or "YOUR_API_KEY" in api_key:
        print("Error: API key for 'lean_explore' not found in settings.toml or is a placeholder.")
        return False

    print(f"Reading records from {settings.expanded_pairs_file}...")
    records_to_process = []
    with settings.expanded_pairs_file.open('r', encoding='utf-8') as f:
        for line in f:
            records_to_process.append(json.loads(line))
            
    if args.resume:
        print("Resume flag set. Checking for processed records...")
        processed_keys = load_processed_keys(settings.incorrect_proofs_file)
        records_to_process = [
            r for r in records_to_process 
            if (r.get('path'), r.get('src_hash'), r.get('theorem')) not in processed_keys
        ]
        print(f"Found {len(processed_keys)} processed records. Skipping them.")
        
    if not records_to_process:
        print("No new records to process. Exiting.")
        print("--- [Step 4] Complete ---")
        return True
        
    print(f"Processing {len(records_to_process)} new records.")

    limiter = AsyncLimiter(RATE_LIMIT, 1)
    tasks = [generate_similar_theorem_mutation_for_record(rec, api_key, limiter) for rec in records_to_process]
    
    print(f"Sending {len(tasks)} tasks to the API (this may take a while)...")
    results_list = await asyncio.gather(*tasks)
    
    file_mode = 'a' if args.resume else 'w'
    lines_written = 0
    with settings.incorrect_proofs_file.open(file_mode, encoding='utf-8') as f:
        for record_list in results_list:
            for record in record_list:
                f.write(json.dumps(record, ensure_ascii=False) + '\n')
                lines_written += 1
                
    print(f"\nSuccess. Wrote {lines_written} new incorrect proof records to {settings.incorrect_proofs_file}.")
    print("--- [Step 4] Complete ---")
    return True

def run_step_5_annotate(args: argparse.Namespace):
    """
    Original logic from annotate_proofs.py
    """
    print("\n--- [Step 5] Annotate Incorrect Proofs ---")

    if not settings.incorrect_proofs_file.exists():
        print(f"Error: Input file not found at '{settings.incorrect_proofs_file}'.")
        print("Please run Step 4 (create_incorrect_proofs) first.")
        return False

    print(f"Input: {settings.incorrect_proofs_file}")
    print(f"Annotated Output: {settings.annotated_proofs_file}")
    print(f"Excluded Output: {settings.excluded_proofs_file}")
    
    if args.resume:
        print("Resume flag set. Annotator will skip already processed proofs (internal logic).")
    
    # --- FIX ---
    # The 'annotate_proofs' function takes positional arguments, not keywords.
    # It also handles its own resume logic internally by checking output files,
    # so we don't need to pass the 'resume' flag.
    annotate_proofs(
        settings.incorrect_proofs_file,
        settings.annotated_proofs_file,
        settings.excluded_proofs_file
    )
    # --- END FIX ---

    print("--- [Step 5] Complete ---")
    return True

# --- 5. Main pipeline execution logic ---

async def main_pipeline(args: argparse.Namespace):
    """
    Runs the full pipeline, checking for prerequisites and resume flags.
    """
    
    # Define checkpoints (output files for each step)
    step_1_output = settings.theorem_cache_file
    step_2_output = settings.theorem_pairs_file
    step_3_output = settings.expanded_pairs_file
    step_4_output = settings.incorrect_proofs_file
    step_5_output_annotated = settings.annotated_proofs_file
    
    # --- Step 1 ---
    if args.resume and step_1_output.exists():
        print("Skipping [Step 1] Build Theorem Cache (output exists).")
    else:
        if not run_step_1_build_cache():
            print("Exiting pipeline due to error in Step 1.")
            return

    # --- Step 2 ---
    if not step_1_output.exists():
        print("Error: Prerequisite for Step 2 not found.")
        print(f"Missing: {step_1_output}")
        return
        
    if args.resume and step_2_output.exists():
        print("Skipping [Step 2] Create Theorem Pairs (output exists).")
    else:
        if not run_step_2_create_pairs():
            print("Exiting pipeline due to error in Step 2.")
            return

    # --- Step 3 ---
    if not step_2_output.exists():
        print("Error: Prerequisite for Step 3 not found.")
        print(f"Missing: {step_2_output}")
        return

    if args.resume and step_3_output.exists():
        print("Skipping [Step 3] Expand Theorem Pairs (output exists).")
    else:
        if not run_step_3_expand_pairs():
            print("Exiting pipeline due to error in Step 3.")
            return

    # --- Step 4 (Async) ---
    if not step_3_output.exists():
        print("Error: Prerequisite for Step 4 not found.")
        print(f"Missing: {step_3_output}")
        return

    if args.resume and step_4_output.exists():
        print("Skipping [Step 4] Create Incorrect Proofs (output exists).")
    else:
        if not await run_step_4_create_incorrect(args):
            print("Exiting pipeline due to error in Step 4.")
            return

    # --- Step 5 ---
    if not step_4_output.exists():
        print("Error: Prerequisite for Step 5 not found.")
        print(f"Missing: {step_4_output}")
        return
        
    if args.resume and step_5_output_annotated.exists():
        print("Skipping [Step 5] Annotate Incorrect Proofs (output exists).")
    else:
        if not run_step_5_annotate(args):
            print("Exiting pipeline due to error in Step 5.")
            return

    print("\n--- Pipeline Finished Successfully ---")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run the full Lean verifier data pipeline.")
    parser.add_argument(
        "--resume", 
        action="store_true", 
        help="Skip steps where the output file already exists."
    )
    args = parser.parse_args()
    
    try:
        asyncio.run(main_pipeline(args))
    except KeyboardInterrupt:
        print("\nPipeline interrupted by user.")
        sys.exit(1)