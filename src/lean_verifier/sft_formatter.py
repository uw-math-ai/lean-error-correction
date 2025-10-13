# src/lean_verifier/sft_formatter.py

import re
from .data_models import ExplainedProof

SYSTEM_PROMPT = (
    "You are a Lean 4 programmer diagnosing a single failing proof. "
    "Assume you only see the incorrect proof text, the infoview state near the failure, "
    "and Lean’s error message."
)

def _strip_code_blocks(s: str) -> str:
    """Removes markdown code blocks from a string."""
    return re.sub(r"```[\s\S]*?```", "", s or "").strip()

def build_prompt(proof: ExplainedProof) -> str:
    """Constructs the 'prompt' part of the SFT entry."""
    base = (
        "**Instruction:** Explain why this proof fails, then explain how to fix it at a high level (no code). "
        "Finally, provide the full corrected Lean 4 theorem/proof in a single ```lean``` code block.\n\n"
        "**Context:**\n\n"
        f"File: `{proof.path}`\n\n"
        f"Incorrect proof:\n```lean\n{proof.incorrect_proof}\n```\n\n"
        f"Infoview state:\n{proof.state_at_error or '(empty)'}\n\n"
        f"Line at error:\n{proof.line_at_error or '(empty)'}\n\n"
        f"Lean error:\n{proof.error or '(empty)'}"
    )
    return base

def build_response(proof: ExplainedProof) -> str:
    """Constructs the 'response' part of the SFT entry."""
    # Clean up the AI-generated text to be sure it doesn't contain code blocks
    explanation = _strip_code_blocks(proof.explanation)
    fix = _strip_code_blocks(proof.fix_suggestion)
    
    return (
        f"Explanation:\n{explanation}\n\n"
        f"Fix:\n{fix}\n\n"
        f"Corrected Lean proof:\n```lean\n{proof.correct_proof}\n```"
    )

def create_sft_entry(proof: ExplainedProof) -> dict:
    """Creates a single, complete entry for the SFT dataset."""
    return {
        "system": SYSTEM_PROMPT,
        "prompt": build_prompt(proof),
        "response": build_response(proof)
    }