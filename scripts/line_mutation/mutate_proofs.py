# scripts/line_mutation/mutate_proofs.py
import shutil
import asyncio
import json
import os

from lean_verifier.mutation_generator import generate_model_replaces_line_mutation_for_record, RATE_LIMIT
from lean_verifier.config import settings
from aiolimiter import AsyncLimiter

async def main_async():
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
    
    limiter = AsyncLimiter(RATE_LIMIT, 1)
    with open(settings.line_mutation_input_file, 'r') as in_file, open(settings.dubious_proofs_file, 'a') as out_file:
        in_lines = in_file.readlines()
        while len(in_lines) != 0:
            try:
                line = json.loads(in_lines.pop())
                out_file.write(json.dumps({
                    "path": line["path"],
                    "correct_proof": line["text"],
                    "incorrect_proof": await generate_model_replaces_line_mutation_for_record(line["text"], limiter) #TODO: I believe we can paralelize this
                    }) + "\n")
            except Exception as e:
                with open(settings.line_mutation_input_file, 'w') as in_file_w:
                    in_file_w.writelines(in_lines)
                raise e
    os.remove(settings.line_mutation_input_file)


def main():
    try:
        asyncio.run(main_async())
    except KeyboardInterrupt:
        print("\nProcess interrupted by user.")

if __name__ == "__main__":
    main()

