# scripts/generate_explanations.py

import json
import time
from pathlib import Path
import sys

# Add the project's 'src' directory to the Python path
project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.data_models import AnnotatedProof
from lean_verifier.explanation_generator import generate_explanation

def main():
    """Main function for Step 6: Generate AI Explanations."""
    print("--- Starting Step 6: Generate AI Explanations ---")

    # --- 1. Check for API Key ---
    api_key = settings.api_keys.get("openai")
    if not api_key or "YOUR_OPENAI_API_KEY" in api_key:
        print("Error: OpenAI API key not found or not set in pyproject.toml.")
        return

    # --- 2. Load input data from Step 5 ---
    if not settings.annotated_proofs_file.exists():
        print(f"Error: Input file not found at '{settings.annotated_proofs_file}'.")
        print("Please run the 'annotate_proofs.py' script first.")
        return

    proofs_to_process = []
    with settings.annotated_proofs_file.open('r', encoding='utf-8') as f:
        for line in f:
            proofs_to_process.append(AnnotatedProof.from_dict(json.loads(line)))
    
    print(f"Found {len(proofs_to_process)} annotated proofs to explain.")

    # --- 3. Process each proof and generate explanations ---
    # This is an API-bound task, so we run it sequentially to avoid overwhelming
    # the API
    
    with settings.explained_proofs_file.open('w', encoding='utf-8') as outfile:
        for i, proof in enumerate(proofs_to_process):
            print(f"Processing proof {i+1}/{len(proofs_to_process)} ({proof.path})...")
            try:
                cause, fix = generate_explanation(proof, settings)
                
                output_data = proof.to_dict()
                output_data['explanation'] = cause
                output_data['fix_suggestion'] = fix
                
                outfile.write(json.dumps(output_data) + '\n')
                
            except Exception as e:
                # print(f"Failed to process proof {i+1}. Error: {e}")
                raise e
            
            # A small delay to be kind to the API
            time.sleep(0.5)

    print(f"\nSuccess. Wrote {len(proofs_to_process)} explained proofs to {settings.explained_proofs_file}.")

if __name__ == "__main__":
    main()