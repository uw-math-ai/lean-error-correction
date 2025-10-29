# src/lean_verifier/annotation_generator.py

import json
import time
import argparse
import multiprocessing as mp
from pathlib import Path
import sys

project_root = Path(__file__).parent.parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.data_models import ProofPair
from lean_verifier.core import annotate_proof_worker
from lean_interact import LeanREPLConfig, TempRequireProject


def _annotate_one(config, pair, annotated_proofs_file, excluded_proofs_file):
    status, data = annotate_proof_worker(config, pair)
    with open(annotated_proofs_file, 'a') as f_ann, open(excluded_proofs_file, 'a') as f_exc:
        line = json.dumps(data) + '\n'
        if status == 'annotated':
            f_ann.write(line)
        else:
            f_exc.write(line)


def annotate_proofs(incorrect_proofs_file, annotated_proofs_file, excluded_proofs_file, output_dir=settings.output_dir):
    """Annotate proofs given files to work from."""
    parser = argparse.ArgumentParser(description="Verify and annotate incorrect proofs.")
    args = parser.parse_args()

    print("--- Annotate Incorrect Proofs ---")

    if not incorrect_proofs_file.exists():
        print(f"Error: Input file not found at '{incorrect_proofs_file}'.")
        print("Please run the 'create_incorrect_proofs.py' script first.")
        return

    # Load all the proof pairs into our class structure
    proof_pairs_to_process = []
    with incorrect_proofs_file.open('r', encoding='utf-8') as f:
        for line in f:
            proof_pairs_to_process.append(ProofPair.from_dict(json.loads(line)))
            
    print(f"Found {len(proof_pairs_to_process)} proof pairs to process.")
    output_dir.mkdir(exist_ok=True)

    print("\nInitializing Lean environment with Mathlib...")
    config = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))
    print("Lean environment is ready.")

    print(f"\nProcessing in parallel with {settings.num_processes} workers...")
    start_time = time.time()
    
    ctx = mp.get_context("spawn")
    with ctx.Pool(processes=settings.num_processes) as pool:
        results = pool.starmap(_annotate_one, [(config, pair, annotated_proofs_file, excluded_proofs_file) for pair in proof_pairs_to_process])

    end_time = time.time()
    print(f"Processing complete in {end_time - start_time:.2f} seconds.")