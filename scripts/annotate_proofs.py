# scripts/annotate_proofs.py

import json
import time
import argparse
import multiprocessing as mp
from pathlib import Path
import sys
import hashlib
import functools

project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.data_models import ProofPair
from lean_verifier.core import annotate_proof_worker
from lean_interact import LeanREPLConfig, TempRequireProject

def load_processed_hashes(annotated_file: Path, excluded_file: Path) -> set[str]:
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

def main():
    """Main function for Annotate Incorrect Proofs."""
    parser = argparse.ArgumentParser(description="Verify and annotate incorrect proofs.")
    parser.add_argument("--resume", action="store_true", help="Skip proofs that have already been processed.")
    args = parser.parse_args()

    print("--- Annotate Incorrect Proofs ---")

    if not settings.incorrect_proofs_file.exists():
        print(f"Error: Input file not found at '{settings.incorrect_proofs_file}'.")
        print("Please run the 'create_incorrect_proofs.py' script first.")
        return

    # Load all the proof pairs into our class structure
    all_proof_pairs = []
    with settings.incorrect_proofs_file.open('r', encoding='utf-8') as f:
        for line in f:
            all_proof_pairs.append(ProofPair.from_dict(json.loads(line)))
            
    print(f"Found {len(all_proof_pairs)} total proof pairs.")

    proof_pairs_to_process = all_proof_pairs
    
    if args.resume:
        print("Resume flag used. Checking for already processed proofs...")
        processed_hashes = load_processed_hashes(
            settings.annotated_proofs_file, 
            settings.excluded_proofs_file
        )
        
        def get_hash(text: str) -> str:
            return hashlib.sha1(text.encode('utf-8')).hexdigest()

        proof_pairs_to_process = [
            p for p in all_proof_pairs 
            if get_hash(p.incorrect_proof) not in processed_hashes
        ]
        print(f"Found {len(processed_hashes)} processed proofs. Skipping them.")
    
    if not proof_pairs_to_process:
        print("No new proofs to process.")
        return

    print(f"Processing {len(proof_pairs_to_process)} new proofs.")
    settings.output_dir.mkdir(exist_ok=True)

    print("\nInitializing Lean environment with Mathlib...")
    config = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))
    print("Lean environment is ready.")

    print(f"\nProcessing in parallel with {settings.num_processes} workers...")
    start_time = time.time()
    
    ctx = mp.get_context("spawn")
    
    # --- Set file mode for resume ---
    file_mode = 'a' if args.resume else 'w'
    annotated_count = 0
    excluded_count = 0
    total_to_process = len(proof_pairs_to_process)
    
    worker_func = functools.partial(annotate_proof_worker, config)

    with ctx.Pool(processes=settings.num_processes) as pool, \
         open(settings.annotated_proofs_file, file_mode) as f_ann, \
         open(settings.excluded_proofs_file, file_mode) as f_exc:

        results_iter = pool.imap_unordered(worker_func, proof_pairs_to_process)
        
        for i, (status, data) in enumerate(results_iter):
            print(f"  [{i+1}/{total_to_process}] Checked: {data.get('path', 'N/A')} -> {status.upper()}")
            
            line = json.dumps(data, ensure_ascii=False) + '\n'
            
            if status == 'annotated':
                f_ann.write(line)
                annotated_count += 1
            else:
                f_exc.write(line)
                excluded_count += 1

    end_time = time.time()
    print(f"Processing complete in {end_time - start_time:.2f} seconds.")

    print("\n--- Summary ---")
    print(f"New Annotated (failed as expected): {annotated_count} proofs appended to {settings.annotated_proofs_file}")
    print(f"New Excluded (passed unexpectedly): {excluded_count} proofs appended to {settings.excluded_proofs_file}")

if __name__ == "__main__":
    main()