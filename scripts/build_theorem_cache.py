# scripts/build_theorem_cache.py

import json
from pathlib import Path
import sys

project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.theorem_prover import extract_identifiers_from_text, classify_identifiers
from lean_interact import LeanREPLConfig, TempRequireProject

def main():
    print("--- Build Theorem Cache ---")

    # --- Load data from the previous step (filter_files.py) ---
    if not settings.pass_output_file.exists():
        print(f"Error: Input file not found at '{settings.pass_output_file}'.")
        print("Please run the 'filter_files.py' script first.")
        return

    # --- Collect all unique identifiers from successful files ---
    print(f"Reading successful files from {settings.pass_output_file}...")
    all_identifiers = set()
    with settings.pass_output_file.open('r', encoding='utf-8') as f:
        for line in f:
            data = json.loads(line)
            if 'text' in data:
                identifiers = extract_identifiers_from_text(data['text'])
                all_identifiers.update(identifiers)
    
    print(f"Found {len(all_identifiers)} unique identifiers.")

    # --- Find which identifiers are new ---
    existing_cache = {}
    if settings.theorem_cache_file.exists():
        print(f"Loading existing cache from {settings.theorem_cache_file}...")
        existing_cache = json.loads(settings.theorem_cache_file.read_text(encoding='utf-8'))
        print(f"Found {len(existing_cache)} identifiers in cache.")
        
    unknown_identifiers = sorted([i for i in all_identifiers if i not in existing_cache])

    if not unknown_identifiers:
        print("No new identifiers to classify. Cache is up to date.")
        return
        
    print(f"Found {len(unknown_identifiers)} new identifiers to classify.")

    # --- Classify the new identifiers using our Lean probe ---
    print("\nInitializing Lean environment...")
    config = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))
    
    newly_classified_ids = classify_identifiers(config, unknown_identifiers)
    
    # --- Update and save the cache ---
    print("\nUpdating and saving the theorem cache...")
    existing_cache.update(newly_classified_ids)
    
    with settings.theorem_cache_file.open('w', encoding='utf-8') as f:
        json.dump(existing_cache, f, indent=2, sort_keys=True)
        
    print(f"Cache updated with {len(newly_classified_ids)} new entries.")
    print(f"Total cached identifiers: {len(existing_cache)}.")
    print(f"Cache saved to {settings.theorem_cache_file}.")

if __name__ == "__main__":
    main()