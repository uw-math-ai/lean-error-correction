# scripts/generate_explanations.py

import json
import time
from pathlib import Path
import sys
import argparse
import hashlib
import os 
from concurrent.futures import ThreadPoolExecutor, as_completed 
import threading

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

# Defaults to keep things safe
MAX_WORKERS = int(os.getenv("GEN_EXPL_WORKERS", "16"))
QPS = float(os.getenv("GEN_EXPL_QPS", "5.0"))
_rl_lock = threading.Lock()
_last_ts = [0.0]

def _rate_limit():
    if QPS <= 0:
        return
    import time as _t
    with _rl_lock:
        now = _t.time()
        interval = 1.0 / QPS
        wait = _last_ts[0] + interval - now
        if wait > 0:
            _t.sleep(wait)
        _last_ts[0] = max(_last_ts[0] + interval, now)

def _process_one(proof: AnnotatedProof) -> dict:
    _rate_limit()
    explanation, fix = generate_explanation(proof, settings)

    if not explanation:
        explanation = "The proof fails due to a mismatch between the goal and the facts/tactics used."
    if not fix:
        fix = "Adjust the tactic or theorem usage to match the goal’s type and required side conditions."

    out = proof.to_dict()
    out["explanation"] = explanation
    out["fix_suggestion"] = fix
    return out

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
            proof_hash = hashlib.sha1(data.get('incorrect_proof', '').encode('utf-8')).hexdigest()
            if proof_hash not in processed_hashes:
                proofs_to_process.append(AnnotatedProof.from_dict(data))
    
    if not proofs_to_process:
        print("No new proofs to process. Exiting.")
        return

    print(f"Found {len(proofs_to_process)} new annotated proofs to explain.")

    # --- 4. Parallel processing (bounded) ---
    file_mode = 'a' if args.resume else 'w'
    new_explanations_count = 0
    write_lock = threading.Lock()

    with settings.explained_proofs_file.open(file_mode, encoding='utf-8') as outfile:
        with ThreadPoolExecutor(max_workers=MAX_WORKERS) as ex:
            futures = [ex.submit(_process_one, p) for p in proofs_to_process]
            for i, fut in enumerate(as_completed(futures), start=1):
                try:
                    out = fut.result()
                    with write_lock:
                        outfile.write(json.dumps(out, ensure_ascii=False) + "\n")
                        new_explanations_count += 1
                    if i % 50 == 0:
                        print(f"Progress: {i}/{len(proofs_to_process)}...")
                except Exception as e:
                    print(f"ERROR: Failed to process proof {i} : {e}")
                    continue

    print(f"\nSuccess. Wrote {new_explanations_count} new explained proofs to {settings.explained_proofs_file}.")

if __name__ == "__main__":
    main()


