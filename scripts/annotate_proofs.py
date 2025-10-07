# scripts/annotate_proofs.py

import json
import time
import argparse
import multiprocessing as mp
from pathlib import Path
import sys

project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.data_models import ProofPair
from lean_verifier.core import annotate_proof_worker
from lean_interact import LeanREPLConfig, TempRequireProject

def main():
    """Main function for Annotate Incorrect Proofs."""
    parser = argparse.ArgumentParser(description="Verify and annotate incorrect proofs.")
    args = parser.parse_args()

    print("--- Annotate Incorrect Proofs ---")

    if not settings.incorrect_proofs_file.exists():
        print(f"Error: Input file not found at '{settings.incorrect_proofs_file}'.")
        print("Please run the 'create_incorrect_proofs.py' script first.")
        return

    # Load all the proof pairs into our class structure
    proof_pairs_to_process = []
    with settings.incorrect_proofs_file.open('r', encoding='utf-8') as f:
        for line in f:
            proof_pairs_to_process.append(ProofPair.from_dict(json.loads(line)))
            
    print(f"Found {len(proof_pairs_to_process)} proof pairs to process.")
    settings.output_dir.mkdir(exist_ok=True)

    print("\nInitializing Lean environment with Mathlib...")
    config = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))
    print("Lean environment is ready.")

    print(f"\nProcessing in parallel with {settings.num_processes} workers...")
    start_time = time.time()
    
    ctx = mp.get_context("spawn")
    with ctx.Pool(processes=settings.num_processes) as pool:
        results = pool.starmap(annotate_proof_worker, [(config, pair) for pair in proof_pairs_to_process])

    end_time = time.time()
    print(f"Processing complete in {end_time - start_time:.2f} seconds.")

    # --- Write the results to the two output files ---
    annotated_count = 0
    excluded_count = 0
    with open(settings.annotated_proofs_file, 'w') as f_ann, open(settings.excluded_proofs_file, 'w') as f_exc:
        for status, data in results:
            line = json.dumps(data) + '\n'
            if status == 'annotated':
                f_ann.write(line)
                annotated_count += 1
            else:
                f_exc.write(line)
                excluded_count += 1
    
    print("\n--- Summary ---")
    print(f"Annotated (failed as expected): {annotated_count} proofs written to {settings.annotated_proofs_file}")
    print(f"Excluded (passed unexpectedly): {excluded_count} proofs written to {settings.excluded_proofs_file}")

if __name__ == "__main__":
    main()