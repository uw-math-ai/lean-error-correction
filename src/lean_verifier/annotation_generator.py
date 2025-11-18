# src/lean_verifier/annotation_generator.py

import json
import time
import multiprocessing as mp
import functools
from pathlib import Path
import sys
import hashlib

# Ensure path is correct if run directly
project_root = Path(__file__).parent.parent.parent
src_path = project_root / "src"
if str(src_path) not in sys.path:
    sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.data_models import ProofPair
from lean_verifier.core import annotate_proof_worker
from lean_interact import LeanREPLConfig, TempRequireProject

def _annotate_one(config, pair):
    """
    Worker wrapper. Returns the result instead of writing to file 
    to avoid race conditions.
    """
    return annotate_proof_worker(config, pair)

def load_processed_hashes(annotated_file: Path, excluded_file: Path) -> set[str]:
    """
    Helper to load SHA1 hashes of proof texts that are already done.
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
                        # Check specific keys depending on which file it is
                        if 'incorrect_proof' in data:
                            processed_hashes.add(get_hash(data['incorrect_proof']))
                    except (json.JSONDecodeError, KeyError):
                        continue
    return processed_hashes

def annotate_proofs(incorrect_proofs_file, annotated_proofs_file, excluded_proofs_file, output_dir=settings.output_dir):
    """
    Main function to annotate proofs. 
    Designed to be called by run_pipeline.py.
    """
    print("--- Annotate Incorrect Proofs ---")

    if not incorrect_proofs_file.exists():
        print(f"Error: Input file not found at '{incorrect_proofs_file}'.")
        return

    # 1. Load Resume Data
    # We check what has already been written to output files to avoid re-doing work.
    existing_hashes = load_processed_hashes(annotated_proofs_file, excluded_proofs_file)
    if existing_hashes:
        print(f"Resuming: Found {len(existing_hashes)} already processed proofs.")

    # 2. Load and Filter Input Data
    proof_pairs_to_process = []
    skipped_count = 0
    
    with incorrect_proofs_file.open('r', encoding='utf-8') as f:
        for line in f:
            try:
                raw_data = json.loads(line)
                # Calculate hash to see if we should skip
                txt_hash = hashlib.sha1(raw_data['incorrect_proof'].encode('utf-8')).hexdigest()
                
                if txt_hash not in existing_hashes:
                    proof_pairs_to_process.append(ProofPair.from_dict(raw_data))
                else:
                    skipped_count += 1
            except (json.JSONDecodeError, KeyError):
                continue
            
    print(f"Found {len(proof_pairs_to_process)} new proof pairs to process (Skipped {skipped_count}).")
    
    if not proof_pairs_to_process:
        print("No new proofs to annotate.")
        return

    output_dir.mkdir(exist_ok=True)

    print("\nInitializing Lean environment with Mathlib...")
    # Initialize config once in the main process
    config = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))
    print("Lean environment is ready.")

    print(f"\nProcessing in parallel with {settings.num_processes} workers...")
    start_time = time.time()
    
    # 3. Run Parallel Processing
    # We use partial to bind the 'config' argument, so we map over just the proof pairs.
    worker_func = functools.partial(_annotate_one, config)
    
    ctx = mp.get_context("spawn")
    
    # Open files ONCE in the main process to avoid locking issues
    with ctx.Pool(processes=settings.num_processes) as pool, \
         open(annotated_proofs_file, 'a', encoding='utf-8') as f_ann, \
         open(excluded_proofs_file, 'a', encoding='utf-8') as f_exc:
        
        # imap_unordered yields results as soon as they are ready
        results = pool.imap_unordered(worker_func, proof_pairs_to_process)
        
        for i, (status, data) in enumerate(results):
            # Progress feedback
            if i % 10 == 0:
                print(f"  Processed {i+1}/{len(proof_pairs_to_process)}...", end='\r')

            line = json.dumps(data, ensure_ascii=False) + '\n'
            
            if status == 'annotated':
                f_ann.write(line)
                # Flush periodically so data is safe if script is killed
                if i % 20 == 0: f_ann.flush()
            else:
                f_exc.write(line)
                if i % 20 == 0: f_exc.flush()

    end_time = time.time()
    print(f"\nProcessing complete in {end_time - start_time:.2f} seconds.")