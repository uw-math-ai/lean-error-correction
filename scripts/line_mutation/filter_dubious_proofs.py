import asyncio
import json
import shutil
import os

from lean_verifier.config import settings
from aiolimiter import AsyncLimiter
from lean_verifier.mutation_generator import RATE_LIMIT
from lean_verifier.core import verify_lean_code, annotate_proof_worker
from lean_verifier.data_models import ProofPair
from lean_interact import AutoLeanServer, LeanREPLConfig, TempRequireProject


async def main_async():
    """Filters the dubious proofs produced by mutate_proofs.py, """
    if not settings.dubious_proofs_file.exists():
        print(f"Error: Input file not found at '{settings.dubious_proofs_file}'.")
        print("Please run the 'line_mutation/mutate_proofs.py' script first.")
        return
    
    if not settings.dubious_filter_input_file.exists() or not settings.dubious_filter_input_file.open().readlines():
        print(f"No input file or empty input file detected, creating new input file...")
        shutil.copyfile(settings.dubious_proofs_file, settings.dubious_filter_input_file)
    else:
        print(f"Input file detected, resuming...")
    
    limiter = AsyncLimiter(RATE_LIMIT, 1)
    print("\nInitializing Lean environment with Mathlib... (This may be slow the first time)")
    config = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))
    with open(settings.dubious_filter_input_file, 'r') as in_file, open(settings.line_mutation_pairs_file, 'a') as out_file:
        in_lines = in_file.readlines()
        while len(in_lines) != 0:
            try:
                line = json.loads(in_lines.pop())
                outcome = annotate_proof_worker(config, ProofPair.from_dict(line))
                if outcome[0] == "annotated":
                    out_file.write(json.dumps(outcome[1])+"\n")
            except Exception as e:
                with open(settings.dubious_filter_input_file, 'w') as in_file_w:
                    in_file_w.writelines(in_lines)
                raise e
    os.remove(settings.dubious_filter_input_file)


def main():
    try:
        asyncio.run(main_async())
    except KeyboardInterrupt:
        print("\nProcess interrupted by user.")

if __name__ == "__main__":
    main()