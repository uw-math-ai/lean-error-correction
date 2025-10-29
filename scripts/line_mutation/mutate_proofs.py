# scripts/line_mutation/mutate_proofs.py
import shutil
import asyncio
import json
import os
import time

from lean_verifier.mutation_generator import generate_model_replaces_line_mutation_for_record, RATE_LIMIT
from lean_verifier.config import settings
from aiolimiter import AsyncLimiter
from concurrent.futures import ThreadPoolExecutor, as_completed 
import threading

async def _process_one(line):
    with threading.Lock():
        settings.dubious_proofs_file.open('a').write(json.dumps({
                    "path": line["path"],
                    "correct_proof": line["text"],
                    "incorrect_proof": await generate_model_replaces_line_mutation_for_record(line["text"])
                }) + "\n")

async def _process_all():
    """Generates dubious single line mutations of known correct proofs."""

    if not settings.pass_output_file.exists():
        print(f"Error: Input file not found at '{settings.pass_output_file}'.")
        print("Please run the 'filter_files.py' script first.")
        return
    
    if not settings.line_mutation_input_file.exists() or not settings.line_mutation_input_file.open().readlines():
        print(f"No input file or empty input file detected, creating new input file...")
        shutil.copyfile(settings.pass_output_file, settings.line_mutation_input_file)
    else:
        print(f"Input file detected, resuming...")
    
    start = time.time()

    file_mode = 'a'
    write_lock = threading.Lock()
    proofs_to_process = [json.dumps(line) for line in settings.line_mutation_input_file.open('r').readlines()]

    await asyncio.gather(*[_process_one(json.loads(line)) for line in settings.line_mutation_input_file.open('r').readlines()])

def main():
    settings.dubious_proofs_file.open('a').writelines(asyncio.run(_process_all()))

if __name__ == "__main__":
    main()

