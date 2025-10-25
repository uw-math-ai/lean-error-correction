import json
import time
from pathlib import Path
import sys
import argparse
import hashlib

project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.data_models import AnnotatedProof
from lean_verifier.explanation_generator import generate_explanation

def load_processed_proofs(output_file: Path) -> set[str]:
    """
    Reads the output file and returns a set of SHA1 hashes
    of the 'incorrect_proof' text for all processed records.
    """
    processed_hashes = set()
    if not output_file.exists():
        return processed_hashes
    
    with output_file.open('r', encoding='utf-8') as f:
        for line in f:
            try:
                data = json.loads(line)
                if 'incorrect_proof' in data:
                    proof_hash = hashlib.sha1(data['incorrect_proof'].encode('utf-8')).hexdigest()
                    processed_hashes.add(proof_hash)
            except (json.JSONDecodeError, KeyError):
                continue
    return processed_hashes

def main():
    """Main function for Step 6: Generate AI Explanations."""
    parser = argparse.ArgumentParser(description="Generate AI explanations for annotated proofs.")
    parser.add_argument("--resume", action="store_true", help="Skip proofs that are already in the output file.")
    args = parser.parse_args()

    print("--- Starting Step 6: Generate AI Explanations ---")

    # --- 1. Check for API Key ---
    api_key = settings.api_keys.get("gemini")
    if not api_key or "YOUR_GEMINI_API_KEY" in api_key:
        print("Error: Gemini API key not found or not set in pyproject.toml.")
        print("Please add your key to [tool.lean_verifier.api_keys]")
        return

    # --- 2. Load input data from Step 5 ---
    if not settings.annotated_proofs_file.exists():
        print(f"Error: Input file not found at '{settings.annotated_proofs_file}'.")
        print("Please run the 'annotate_proofs.py' script first.")
        return

    # --- 3. Load processed proofs if resuming ---
    processed_hashes = set()
    if args.resume:
        print("Resume flag detected. Loading already processed proofs...")
        processed_hashes = load_processed_proofs(settings.explained_proofs_file)
        print(f"Found {len(processed_hashes)} already processed proofs. Skipping them.")

    proofs_to_process = []
    with settings.annotated_proofs_file.open('r', encoding='utf-8') as f:
        for line in f:
            data = json.loads(line)
            # Create a hash of the incorrect proof to see if we've processed it
            proof_hash = hashlib.sha1(data.get('incorrect_proof', '').encode('utf-8')).hexdigest()
            
            if proof_hash not in processed_hashes:
                proofs_to_process.append(AnnotatedProof.from_dict(data))
    
    if not proofs_to_process:
        print("No new proofs to process. Exiting.")
        return

    print(f"Found {len(proofs_to_process)} new annotated proofs to explain.")

    # --- 4. Process each proof and generate explanations ---
    # This is an API-bound task, so we run it sequentially to avoid overwhelming
    # the API
    
    # Open in 'append' mode if resuming, otherwise 'write' mode
    file_mode = 'a' if args.resume else 'w'
    new_explanations_count = 0
    
    with settings.explained_proofs_file.open(file_mode, encoding='utf-8') as outfile:
        for i, proof in enumerate(proofs_to_process):
            print(f"Processing proof {i+1}/{len(proofs_to_process)} ({proof.path})...")
            try:
                cause, fix = generate_explanation(proof, settings)
                
                output_data = proof.to_dict()
                output_data['explanation'] = cause
                output_data['fix_suggestion'] = fix
                
                outfile.write(json.dumps(output_data, ensure_ascii=False) + "\n")
                new_explanations_count += 1
                
            except Exception as e:
                print(f"ERROR: Failed to process proof {i+1} ({proof.path}). Error: {e}")
                print("Skipping this proof and continuing...")
                continue
            
            # A small delay to be kind to the API
            time.sleep(0.5)

    print(f"\nSuccess. Wrote {new_explanations_count} new explained proofs to {settings.explained_proofs_file}.")

if __name__ == "__main__":
    main()
