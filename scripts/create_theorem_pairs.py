# scripts/create_theorem_pairs.py

import json
from pathlib import Path
import sys

project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.theorem_prover import select_theorems_from_text

def main():
    """
    Reads successful files and the theorem cache,
    and produces a new JSONL file pairing files with the theorems they contain.
    """
    print("--- Create Theorem Pairs ---")

    # --- Check for necessary input files ---
    if not settings.pass_output_file.exists():
        print(f"Error: Input file not found at '{settings.pass_output_file}'.")
        print("Please run the 'filter_files.py' script first.")
        return
        
    if not settings.theorem_cache_file.exists():
        print(f"Error: Theorem cache not found at '{settings.theorem_cache_file}'.")
        print("Please run the 'build_theorem_cache.py' script first.")
        return

    # --- Load the theorem cache ---
    print(f"Loading theorem cache from {settings.theorem_cache_file}...")
    with settings.theorem_cache_file.open('r', encoding='utf-8') as f:
        theorem_cache = json.load(f)
    print(f"Loaded {len(theorem_cache)} entries from cache.")

    # --- 3. Process successful files and create pairs ---
    print(f"Processing successful files from {settings.pass_output_file}...")
    
    lines_written = 0
    with settings.pass_output_file.open('r', encoding='utf-8') as infile, \
         settings.theorem_pairs_file.open('w', encoding='utf-8') as outfile:
        
        for line in infile:
            data = json.loads(line)
            
            # Find all confirmed theorems in the file's text
            theorem_ids = select_theorems_from_text(data['text'], theorem_cache)
            
            # If we found any theorems, write a new record to the output file
            if theorem_ids:
                output_record = {
                    "path": data["path"],
                    "text": data["text"],
                    "src_hash": data["src_hash"],
                    "ids": theorem_ids 
                }
                outfile.write(json.dumps(output_record) + '\n')
                lines_written += 1

    print(f"\nSuccess! Wrote {lines_written} theorem pairs to {settings.theorem_pairs_file}.")


if __name__ == "__main__":
    main()