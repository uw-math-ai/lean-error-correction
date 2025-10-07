# scripts/expand_theorem_pairs.py

import json
from pathlib import Path
import sys

project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.config import settings

def main():
    """
    Reads the theorem pairs file and expands it,
    creating one output record per theorem.
    """
    print("--- Starting Expand Theorem Pairs ---")

    # --- Check for the necessary input file from previous step ---
    if not settings.theorem_pairs_file.exists():
        print(f"Error: Input file not found at '{settings.theorem_pairs_file}'.")
        print("Please run the 'create_theorem_pairs.py' script first.")
        return

    print(f"Reading theorem pairs from {settings.theorem_pairs_file}...")
    
    # --- Process the file and write the expanded output ---
    input_lines = 0
    output_lines = 0
    with settings.theorem_pairs_file.open('r', encoding='utf-8') as infile, \
         settings.expanded_pairs_file.open('w', encoding='utf-8') as outfile:
        
        for line in infile:
            input_lines += 1
            data = json.loads(line)
            
            # The list of theorem IDs from previous step
            theorem_ids = data.get("ids", [])
            
            # Loop through each theorem ID and create a new record for it
            for theorem_id in theorem_ids:
                output_record = {
                    "path": data["path"],
                    "text": data["text"],
                    "src_hash": data["src_hash"],
                    "theorem": theorem_id
                }
                outfile.write(json.dumps(output_record) + '\n')
                output_lines += 1

    print(f"\nProcessed {input_lines} input files.")
    print(f"Success. Wrote {output_lines} expanded theorem records to {settings.expanded_pairs_file}.")


if __name__ == "__main__":
    main()