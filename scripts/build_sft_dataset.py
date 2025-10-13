# scripts/build_sft_dataset.py

import json
from pathlib import Path
import sys
import hashlib

# Add the project's 'src' directory to the Python path
project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.data_models import ExplainedProof
from lean_verifier.sft_formatter import create_sft_entry

def main():
    """Main function for Step 7: Build the SFT Dataset."""
    print("--- Starting Step 7: Build SFT Dataset ---")

    # --- 1. Load input data from Step 6 ---
    if not settings.explained_proofs_file.exists():
        print(f"Error: Input file not found at '{settings.explained_proofs_file}'.")
        print("Please run the 'generate_explanations.py' script first.")
        return

    # --- 2. Process each explained proof and format it for SFT ---
    print(f"Reading explained proofs from {settings.explained_proofs_file}...")
    
    # Use a set to deduplicate entries based on the incorrect proof content
    seen_proofs = set()
    lines_written = 0
    
    with settings.explained_proofs_file.open('r', encoding='utf-8') as infile, \
         settings.sft_dataset_file.open('w', encoding='utf-8') as outfile:
        
        for line in infile:
            data = json.loads(line)
            proof = ExplainedProof.from_dict(data)
            
            # Your original script had a good deduplication strategy. Let's keep it.
            proof_hash = hashlib.sha1(proof.incorrect_proof.encode('utf-8')).hexdigest()
            if proof_hash in seen_proofs:
                continue
            seen_proofs.add(proof_hash)
            
            # Create the SFT entry and write it to the output file
            sft_entry = create_sft_entry(proof)
            outfile.write(json.dumps(sft_entry) + '\n')
            lines_written += 1

    print(f"\nSuccess. Wrote {lines_written} unique entries to {settings.sft_dataset_file}.")

if __name__ == "__main__":
    main()