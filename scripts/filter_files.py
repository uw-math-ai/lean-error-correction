# scripts/filter_files.py
# Run with `python -m scripts.filter_files --resume` in root directory

import time
import json
import argparse
import multiprocessing as mp
from pathlib import Path

from lean_verifier.data_models import LeanFile
from lean_verifier.core import verify_lean_file
from lean_verifier.config import settings
from lean_interact import LeanREPLConfig, TempRequireProject

# --- Helper and Main Functions ---
def load_processed_hashes(pass_file: Path, fail_file: Path) -> set[str]:
    processed_hashes = set()
    for file_path in [pass_file, fail_file]:
        if file_path.exists():
            with file_path.open('r', encoding='utf-8') as f:
                for line in f:
                    try:
                        data = json.loads(line)
                        if 'src_hash' in data:
                            processed_hashes.add(data['src_hash'])
                    except json.JSONDecodeError:
                        continue
    return processed_hashes

def main():
    parser = argparse.ArgumentParser(description="Filter Lean files into pass/fail categories.")
    parser.add_argument("--resume", action="store_true", help="Skip files that have already been processed.")
    args = parser.parse_args()
    
    print("--- Starting Lean File Filtering ---")
    
    if not settings.source_dir.is_dir():
        print(f"Error: Source directory not found at '{settings.source_dir}'")
        return
    
    all_lean_files = [LeanFile.from_path(p, settings.source_dir) for p in settings.source_dir.rglob("*.lean")]
    print(f"Found {len(all_lean_files)} total .lean files in '{settings.source_dir}'.")

    files_to_process = all_lean_files
    if args.resume:
        print("Resume flag used. Checking for already processed files...")
        processed_hashes = load_processed_hashes(settings.pass_output_file, settings.fail_output_file)
        files_to_process = [f for f in all_lean_files if f.src_hash not in processed_hashes]
        print(f"Found {len(processed_hashes)} processed files. Skipping them.")

    if not files_to_process:
        print("No new files to process.")
        return
    
    print(f"Processing {len(files_to_process)} new files.")
    settings.output_dir.mkdir(exist_ok=True)

    print("\nInitializing Lean environment with Mathlib... (This may be slow the first time)")
    config = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))
    print("Lean environment is ready.")

    print(f"\nProcessing files in parallel with {settings.num_processes} workers...")
    start_time = time.time()
    
    ctx = mp.get_context("spawn")
    with ctx.Pool(processes=settings.num_processes) as pool:
        results = pool.starmap(verify_lean_file, [(config, lf) for lf in files_to_process])

    end_time = time.time()
    print(f"Processing complete in {end_time - start_time:.2f} seconds.")

    pass_count = 0
    fail_count = 0
    
    # If we're resuming, append to the files ('a'). Otherwise, start fresh ('w').
    file_mode = 'a' if args.resume else 'w'
    
    # Go through the results and sort them into the pass and fail files.
    with open(settings.pass_output_file, file_mode) as f_pass, open(settings.fail_output_file, file_mode) as f_fail:
        for status, data in results:
            line = json.dumps(data) + '\n'
            if status == 'pass':
                f_pass.write(line)
                pass_count += 1
            else:
                f_fail.write(line)
                fail_count += 1
    
    print("\n--- Summary ---")
    print(f"New Passed: {pass_count} files appended to {settings.pass_output_file}")
    print(f"New Failed: {fail_count} files appended to {settings.fail_output_file}")

if __name__ == "__main__":
    main()