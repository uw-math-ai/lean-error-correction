# scripts/line_mutation/explain_lme_proofs.py
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
from lean_verifier.data_models import AnnotatedProof
from lean_verifier.explanation_generator import generate_explanation

async def _process_one(line):
    proof = AnnotatedProof.from_dict(line)
    explanation, fix_suggestion = await generate_explanation(proof)
    proof = proof.to_dict()
    proof["explanation"], proof["fix_suggestion"] = explanation, fix_suggestion
    with threading.Lock():
        settings.explained_lme_proofs_file.open('a').write(json.dumps(proof) + "\n")

async def _process_all():
    """Generates dubious single line mutations of known correct proofs."""
    await asyncio.gather(*[_process_one(json.loads(line)) for line in settings.annotated_lme_proofs_file.open('r').readlines()])

def main():
    settings.dubious_proofs_file.open('a').writelines(asyncio.run(_process_all()))

if __name__ == "__main__":
    main()

