# scripts/line_mutation/mutate_proofs.py
import shutil
import asyncio
import json 
import os
import time
import sys

from lean_verifier.mutation_generator import generate_model_replaces_line_mutation_for_record, RATE_LIMIT
from lean_verifier.config import settings
from aiolimiter import AsyncLimiter
from concurrent.futures import ThreadPoolExecutor, as_completed 
from pathlib import Path
import threading

async def _process_one(line, dubious_proofs_file):
    with threading.Lock():
        dubious_proofs_file.open('a').write(json.dumps({
                    "path": line["path"], 
                    "correct_proof": line["text"],
                    "incorrect_proof": await generate_model_replaces_line_mutation_for_record(line["text"])
                }) + "\n")

async def _process_all(dubious_proofs_file=settings.dubious_proofs_file, pass_output_file=settings.pass_output_file, line_mutation_input_file=settings.line_mutation_input_file):
    """Generates dubious single line mutations of known correct proofs."""

    if not pass_output_file.exists():
        print(f"Error: Input file not found at '{pass_output_file}'.")
        print("Please run the 'filter_files.py' script first.")
        return
    
    if not line_mutation_input_file.exists() or not line_mutation_input_file.open().readlines():
        print(f"No input file or empty input file detected, creating new input file...")
        shutil.copyfile(pass_output_file, line_mutation_input_file)
    else:
        print(f"Input file detected, resuming...")
    
    start = time.time()

    file_mode = 'a'
    write_lock = threading.Lock()
    proofs_to_process = [json.dumps(line) for line in line_mutation_input_file.open('r').readlines()]

    await asyncio.gather(*[_process_one(json.loads(line), dubious_proofs_file) for line in line_mutation_input_file.open('r').readlines()])

def main():
    nontrivial_args = sys.argv[1:]
    if len(nontrivial_args) == 0:
        print(f"Beginning work on {settings.line_mutation_input_file}")
        asyncio.run(_process_all())
        os.remove(settings.line_mutation_input_file)
    else:
        dubious_proofs_file, pass_output_file, line_mutation_input_file = [Path(arg) for arg in nontrivial_args]
        print(f"Beginning work on {line_mutation_input_file}")
        asyncio.run(_process_all(dubious_proofs_file, pass_output_file, line_mutation_input_file))
        os.remove(line_mutation_input_file)

if __name__ == "__main__":
    main()

