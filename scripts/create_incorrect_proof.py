# scripts/create_incorrect_proofs.py

import json
import asyncio
from pathlib import Path
import sys
import argparse

project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.mutation_generator import generate_similar_theorem_mutation_for_record, RATE_LIMIT
from aiolimiter import AsyncLimiter

def load_processed_keys(output_file: Path) -> set:
    """Reads an existing output file to find which records have been processed."""
    processed = set()
    if not output_file.exists():
        return processed
    with output_file.open('r', encoding='utf-8') as f:
        for line in f:
            try:
                data = json.loads(line)
                key = (data.get('path'), data.get('src_hash'), data.get('theorem'))
                if all(key):
                    processed.add(key)
            except (json.JSONDecodeError, KeyError):
                continue
    return processed

async def main_async():
    """Main async function to coordinate the mutation generation."""
    parser = argparse.ArgumentParser(description="Generate incorrect proofs from correct ones.")
    parser.add_argument("--resume", action="store_true", help="Skip records that have already been processed.")
    args = parser.parse_args()

    print("--- Create Incorrect Proofs ---")

    # --- Check for API Key ---
    api_key = settings.api_keys.get("lean_explore")
    if not api_key or "YOUR_LEAN_EXPLORE_API_KEY" in api_key:
        print("Error: Lean Explore API key not found or not set in pyproject.toml.")
        print("Please add your key to [tool.lean_verifier.api_keys].")
        return

    # --- Load input data and check for records to skip ---
    if not settings.expanded_pairs_file.exists():
        print(f"Error: Input file not found at '{settings.expanded_pairs_file}'.")
        print("Please run the 'expand_theorem_pairs.py' script first.")
        return
        
    records_to_process = []
    with settings.expanded_pairs_file.open('r', encoding='utf-8') as f:
        for line in f:
            records_to_process.append(json.loads(line))

    if args.resume:
        if not settings.incorrect_proofs_file.exists():
            print(f"Resume flag detected, but {settings.incorrect_proofs_file} does not exist. Starting from scratch.")
        else:
            print("Resume flag detected. Checking for already processed records...")
            processed_keys = load_processed_keys(settings.incorrect_proofs_file)
            records_to_process = [
                r for r in records_to_process 
                if (r.get('path'), r.get('src_hash'), r.get('theorem')) not in processed_keys
            ]
            print(f"Found {len(processed_keys)} processed records. Skipping them.")
        
    if not records_to_process:
        print("No new records to process. Exiting.")
        return
        
    print(f"Processing {len(records_to_process)} new records.")

    # --- Run mutation generation concurrently ---
    limiter = AsyncLimiter(RATE_LIMIT, 1)
    tasks = [generate_similar_theorem_mutation_for_record(rec, api_key, limiter) for rec in records_to_process]
    
    print(f"Sending {len(tasks)} tasks to the API (this may take a while)...")
    results_list = await asyncio.gather(*tasks)
    
    # --- Write results to output file ---
    file_mode = 'a' if args.resume else 'w'
    lines_written = 0
    with settings.incorrect_proofs_file.open(file_mode, encoding='utf-8') as f:
        for record_list in results_list:
            for record in record_list:
                f.write(json.dumps(record) + '\n')
                lines_written += 1
                
    print(f"\n Wrote {lines_written} new incorrect proof records to {settings.incorrect_proofs_file}.")

def main():
    try:
        asyncio.run(main_async())
    except KeyboardInterrupt:
        print("\nProcess interrupted by user.")

if __name__ == "__main__":
    main()