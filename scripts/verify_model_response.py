import time
import json
import argparse
import multiprocessing as mp
import functools
import re
import hashlib
from pathlib import Path
import sys
from typing import List

project_root = Path(__file__).parent.parent
src_path = project_root / "src"
sys.path.append(str(src_path))

from lean_verifier.data_models import LeanFile
from lean_verifier.core import verify_lean_file
from lean_verifier.config import settings
from lean_interact import LeanREPLConfig, TempRequireProject


def extract_lean_code(text: str) -> str | None:
    """Extracts Lean code from a markdown code block."""
    if not text:
        return None
    match = re.search(r"```lean\n(.*?)\n```", text, re.DOTALL)
    if match:
        return match.group(1).strip()
    return None

def load_tasks_from_jsonl(input_file: Path) -> List[LeanFile]:
    """
    Reads the input JSONL file, extracts the model's generated
    Lean code, and creates a list of LeanFile objects to verify.
    """
    tasks = []
    print(f"Reading tasks from {input_file}...")
    with input_file.open('r', encoding='utf-8') as f:
        for i, line in enumerate(f):
            try:
                data = json.loads(line)
                model_response = data.get("model_response")
                
                lean_code = extract_lean_code(model_response)
                if not lean_code:
                    continue
                
                prompt_text = data.get("prompt", "")
                path_match = re.search(r"File: `(.*?)`", prompt_text)
                relative_path = path_match.group(1) if path_match else f"line_{i}_unknown_path.lean"
                
                src_hash = hashlib.sha1(lean_code.encode('utf-8')).hexdigest()
                
                tasks.append(LeanFile(
                    relative_path=relative_path,
                    content=lean_code,
                    src_hash=src_hash
                ))
            except (json.JSONDecodeError, KeyError) as e:
                print(f"Warning: Skipping line {i} due to parse error: {e}")
                continue
    print(f"Found {len(tasks)} valid Lean code blocks to verify.")
    return tasks
    

def load_processed_hashes(pass_file: Path, fail_file: Path) -> set[str]:
    """Reads pass/fail files to find hashes of already processed code blocks."""
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

# --- Main Function ---

def main():
    parser = argparse.ArgumentParser(description="Verify Lean code blocks from model responses.")
    parser.add_argument(
        "--input_file", 
        type=Path, 
        required=True, 
        help="Path to the JSONL file containing model responses."
    )
    parser.add_argument(
        "--resume", 
        action="store_true", 
        help="Skip code blocks that have already been processed."
    )
    args = parser.parse_args()
    
    print("--- Starting Model Response Verification ---")
    
    # Define output files
    pass_file = settings.output_dir / "model_pass.jsonl"
    fail_file = settings.output_dir / "model_fail.jsonl"
    
    # Load all tasks from the JSONL file
    all_tasks = load_tasks_from_jsonl(args.input_file)
    
    tasks_to_process = all_tasks
    if args.resume:
        print("Resume flag used. Checking for already processed code blocks...")
        processed_hashes = load_processed_hashes(pass_file, fail_file)
        tasks_to_process = [f for f in all_tasks if f.src_hash not in processed_hashes]
        print(f"Found {len(processed_hashes)} processed code blocks. Skipping them.")

    if not tasks_to_process:
        print("No new code blocks to process.")
        return
    
    print(f"Processing {len(tasks_to_process)} new code blocks.")
    settings.output_dir.mkdir(exist_ok=True)

    print("\nInitializing Lean environment with Mathlib...")
    config = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))
    print("Lean environment is ready.")

    print(f"\nProcessing in parallel with {settings.num_processes} workers...")
    start_time = time.time()
    
    ctx = mp.get_context("spawn")
    pass_count = 0
    fail_count = 0
    
    file_mode = 'a' if args.resume else 'w'
    
    worker_func = functools.partial(verify_lean_file, config)
    total_files = len(tasks_to_process)

    with ctx.Pool(processes=settings.num_processes) as pool, \
         open(pass_file, file_mode) as f_pass, \
         open(fail_file, file_mode) as f_fail:
        
        results_iter = pool.imap_unordered(worker_func, tasks_to_process)
        
        for i, (status, data) in enumerate(results_iter):
            print(f"  [{i+1}/{total_files}] Checked: {data['path']} (Hash: {data['src_hash'][:7]}...) -> {status.upper()}")
            
            line = json.dumps(data, ensure_ascii=False) + '\n'
            
            if status == 'pass':
                f_pass.write(line)
                pass_count += 1
            else:
                f_fail.write(line)
                fail_count += 1

    end_time = time.time()
    print(f"Processing complete in {end_time - start_time:.2f} seconds.")
    
    print("\n--- Summary ---")
    print(f"New Passed: {pass_count} code blocks written to {pass_file}")
    print(f"New Failed: {fail_count} code blocks written to {fail_file}")

if __name__ == "__main__":
    main()
