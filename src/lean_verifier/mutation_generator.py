# src/lean_verifier/mutation_generator.py

import asyncio
import hashlib
import httpx
import re
import random
from typing import List, Dict, Any, Optional, Tuple
# from lean_verifier.core import verify_lean_file
# from lean_verifier.config import settings
# from lean_interact import LeanREPLConfig, TempRequireProject

from aiolimiter import AsyncLimiter
from lean_explore.api.client import Client
import asyncio

RATE_LIMIT = 5  # requests per second

LINE_REPLACEMENT_PROMPT = """
The following is a correct Lean 4 proof, but it has one line missing. Please help me complete the proof by filling in the line that says 'REDACTED'. Your response will be replace the word 'REDACTED' in the proof.
{broken_proof}
"""
# CONFIG = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))

def _sha256_hex(s: str) -> str:
    return hashlib.sha256(s.encode("utf-8")).hexdigest()

def _token_pattern(base_name: str) -> re.Pattern[str]:
    ident = r"[A-Za-z0-9_’′']"
    ns = rf"(?:{ident}+\.)*"
    return re.compile(rf"(?<!{ident}){ns}{re.escape(base_name)}(?!{ident})")

def _top_prefix(qualified: str) -> str:
    return "" if "." not in qualified else qualified.split(".", 1)[0]

async def _get_similar_names(client: Client, limiter: AsyncLimiter, name: str) -> List[str]:
    """Queries the API for similar names with retries and rate limiting."""
    for attempt in range(3):
        try:
            async with limiter:
                resp = await client.search(name)
            return [hit.primary_declaration.lean_name for hit in resp.results if hit.primary_declaration.lean_name]
        except (httpx.RequestError, httpx.HTTPStatusError) as e:
            print(f"API call for '{name}' failed (attempt {attempt+1}/3): {e}")
            await asyncio.sleep(2 ** attempt)
    return []

async def _get_theorem_info(client: Client, limiter: AsyncLimiter, name: str) -> Dict[str, str]:
    """Gets metadata for a specific theorem."""
    for attempt in range(3):
        try:
            async with limiter:
                resp = await client.search(name)
            if not resp.results:
                return {"name": name, "formal": "", "informal": ""}
            first = resp.results[0]
            return {
                "name": first.primary_declaration.lean_name or name,
                "formal": first.display_statement_text or "",
                "informal": first.informal_description or ""
            }
        except (httpx.RequestError, httpx.HTTPStatusError) as e:
            print(f"API call for '{name}' failed (attempt {attempt+1}/3): {e}")
            await asyncio.sleep(2 ** attempt)
    return {"name": name, "formal": "", "informal": ""}


async def generate_similar_theorem_mutation_for_record(record: Dict[str, Any], api_key: str, limiter: AsyncLimiter) -> List[Dict[str, Any]]:
    """
    For a single theorem record, queries the API to find a replacement and
    generates up to two incorrect proof variants.
    """
    text = record["text"]
    base_theorem = record["theorem"]
    client = Client(api_key=api_key)

    pat = _token_pattern(base_theorem)
    match = pat.search(text)
    if not match:
        return []

    matched_full_name = match.group(0)
    correct_prefix = _top_prefix(matched_full_name)
    
    # Find candidates for replacement
    all_candidates = await _get_similar_names(client, limiter, base_theorem)
    replacements = [
        name for name in all_candidates 
        if name and name != matched_full_name and _top_prefix(name) != correct_prefix
    ]

    output_records = []
    src_hash = _sha256_hex(text)

    # Generate up to 2 incorrect variants
    for incorrect_name in replacements[:2]:
        incorrect_proof = text.replace(matched_full_name, incorrect_name, 1)
        
        # Gather metadata for both theorems
        correct_info_task = _get_theorem_info(client, limiter, matched_full_name)
        incorrect_info_task = _get_theorem_info(client, limiter, incorrect_name)
        correct_info, incorrect_info = await asyncio.gather(correct_info_task, incorrect_info_task)
        
        if correct_info["name"] == incorrect_info["name"]:
            continue

        output_records.append({
            "path": record["path"],
            "theorem": base_theorem,
            "src_hash": src_hash,
            "correct_proof": text,
            "incorrect_proof": incorrect_proof,
            "correct_name": matched_full_name,
            "incorrect_name": incorrect_name,
            "correct_formal": correct_info["formal"],
            "incorrect_formal": incorrect_info["formal"],
            "correct_informal": correct_info["informal"],
            "incorrect_informal": incorrect_info["informal"],
        })

    return output_records

async def generate_model_replaces_line_mutation_for_record(text: str) -> List[Dict[str, Any]]:
    """
    For a single theorem record, asks a given LLM to replace a line, producing up to one varient.
    """
    formal_statement, body = text.split("by\n", 1)
    formal_statement += "by\n"
    proof_lines = body.split('\n')
    proof_lines[random.randrange(0, len(proof_lines))] = "REDACTED"
    redacted_proof = formal_statement + '\n'.join(proof_lines)
    prompt = LINE_REPLACEMENT_PROMPT.format(broken_proof=redacted_proof)

    chat = GeminiInstance(settings.gemini_prover_model, LINE_REPLACEMENT_SYSTEM_PROMPT)
    response = await chat.querry(prompt, generation_config={
        "max_output_tokens": 200
    })
    
    return redacted_proof.replace("REDACTED", response)
