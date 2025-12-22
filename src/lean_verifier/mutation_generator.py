# src/lean_verifier/mutation_generator.py

import asyncio
import hashlib
import httpx
import re
import random
from typing import List, Dict, Any, Optional, Tuple
# from lean_verifier.core import verify_lean_file
from lean_verifier.config import settings
from lean_verifier.llm_zoo import OpenAIInstance, DeepSeekInstance
# from lean_interact import LeanREPLConfig, TempRequireProject

from aiolimiter import AsyncLimiter
from lean_explore.api.client import Client
import asyncio

RATE_LIMIT = 5  # requests per second

LINE_REPLACEMENT_PROMPT = """
One line has been redacted in this lean4 proof. Please complete the proof by providing the correct contents of the redacted line. Your response will be automatically searched for your answer. To facilitate this, please write "MY ANSWER" before your answer. Your answer should be exactly one line long and should contain no semicolons. For example, if you were given
```lean4
theorem very_simple: 1+1=2 := by
  REDACTED
```
you might respond with
\"\"\"
This is very easy, `rfl` accomplishes this in Lean 4.
MY ANSWER
```lean4
rfl
```
\"\"\"
Now try this theorem
```lean4
{broken_proof}
```
"""
LINE_REPLACEMENT_SYSTEM_PROMPT = """
You are a Lean 4 programmer.
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


def remove_imports(text: str) -> str:
    """Strip lines that start with 'import' from the provided Lean source."""
    return "".join(line for line in text.splitlines(keepends=True) if not line.startswith("import"))


def is_line_comment(text: str, line_idx: int) -> bool:
    lines = text.splitlines()
    if line_idx >= len(lines):
        return False
    if lines[line_idx].strip().startswith("--"):
        return True
    pretext = "".join(lines[:line_idx])
    if pretext.count("/-") > pretext.count("-/"):
        return True
    return False


def redact_random_line(text: str) -> str:
    """Replace a random non-comment, non-empty line with an indented REDACTED marker."""
    lines = text.splitlines(keepends=True)
    if not lines:
        return text

    candidates = [
        idx for idx, line in enumerate(lines)
        if line.strip() and not is_line_comment(text, idx)
    ]
    if not candidates:
        return text

    target = random.choice(candidates)

    def _split_line_ending(line: str) -> Tuple[str, str]:
        for ending in ("\r\n", "\n", "\r"):
            if line.endswith(ending):
                return line[:-len(ending)], ending
        return line, ""

    body, newline = _split_line_ending(lines[target])
    indent_match = re.match(r"[ \t]*", body)
    indent = indent_match.group(0) if indent_match else ""
    indent = indent.replace("\n", "").replace("\r", "")
    lines[target] = f"{indent}REDACTED{newline}"
    return "".join(lines)


def clean_response(response:str) -> str:
    return response.split("MY ANSWER")[-1].split("```lean4")[-1].split("```")[0].strip()

def sanitize_theorem_name(formal_statement: str) -> str:
    words = formal_statement.split(" ")
    words[1] = "my_theorem"
    return " ".join(words)


async def generate_model_replaces_line_mutation_for_record(text: str) -> List[Dict[str, Any]]:
    """
    For a single theorem record, asks a given LLM to replace a line, producing up to one varient.
    """
    formal_statement, body = remove_imports(text).split("by", 1)
    formal_statement += "by"
    redacted_body = redact_random_line(body)
    redacted_proof = formal_statement + '\n' + redacted_body
    prompt_proof = sanitize_theorem_name(formal_statement) + '\n' + redacted_body
    prompt = LINE_REPLACEMENT_PROMPT.format(broken_proof=prompt_proof)

    chat = DeepSeekInstance("deepseek-ai/DeepSeek-V3-0324", LINE_REPLACEMENT_SYSTEM_PROMPT)
    response = clean_response(chat.querry(prompt))
    
    return redacted_proof.replace("REDACTED", response.replace("```\nlean\n", "").replace("```", ""))
