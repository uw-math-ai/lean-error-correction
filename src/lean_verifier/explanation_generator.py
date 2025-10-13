# src/lean_verifier/explanation_generator.py

from openai import OpenAI
from typing import Tuple, List, Dict, Any
import time

from .config import Settings
from .data_models import AnnotatedProof


SYSTEM_PROMPT = (
    "You are a Lean 4 programmer diagnosing one failing proof. "
    "Assume you ONLY see the incorrect proof text, the infoview state near the failure, "
    "Lean’s error message, and lemma-name metadata (intended vs substituted). "
    "Write as if deduced from the text/state/error; do not reveal metadata as a source."
)

DIAGNOSIS_INSTRUCTION = (
    "Explain why this single Lean proof fails, without proposing code.\n"
    "Return a compact, evidence-based diagnosis that only uses the provided "
    "incorrect proof snippet, infoview state, Lean error, and the lemma metadata.\n\n"
    "Output format (strict):\n"
    "1) Cause (one sentence): <what went wrong>\n"
    "2) Why it fails (≤2 sentences): <link the delta to the specific error class>"
)

FIX_INSTRUCTION = (
    "Briefly explain how to fix at a high level (no code). "
    "Reference the intended lemma/namespace and the *shape* of required side conditions. "
    "Do not reveal that metadata was provided."
)

def _build_context_block(proof: AnnotatedProof) -> str:
    """Builds the rich context block, including formal/informal metadata."""
    parts = [
        "**Context:**",
        f"Incorrect proof:\n```lean\n{proof.incorrect_proof}\n```",
        f"Infoview state:\n{proof.state_at_error or '(empty)'}",
        f"Lean error:\n{proof.error or '(empty)'}",
    ]
    
    # Add the metadata from step4
    extras = [
        f"Intended (correct) theorem name: {proof.correct_name}",
        f"Used (incorrect) theorem name: {proof.incorrect_name}",
        f"Intended formal statement:\n{proof.correct_formal}",
        f"Used formal statement:\n{proof.incorrect_formal}",
        f"Intended informal description: {proof.correct_informal}",
        f"Used informal description: {proof.incorrect_informal}",
    ]
    parts.append("\n".join(extras))
    return "\n\n".join(parts)


def generate_explanation(proof: AnnotatedProof, settings: Settings) -> Tuple[str, str]:
    """
    Calls the OpenAI API in a two-step process to generate a detailed
    explanation and fix for a given annotated proof.
    """
    client = OpenAI(api_key=settings.api_keys.get("openai"))
    model_cfg = settings.explanation_model
    context = _build_context_block(proof)

    # --- Call 1: Generate the Diagnosis ---
    diag_messages = [
        {"role": "system", "content": SYSTEM_PROMPT},
        {"role": "user", "content": f"{DIAGNOSIS_INSTRUCTION}\n\n{context}"}
    ]
    
    diag_response = client.chat.completions.create(
        model=model_cfg.model_name,
        messages=diag_messages,
        temperature=model_cfg.temperature,
        max_tokens=model_cfg.max_tokens,
        timeout=model_cfg.timeout_seconds,
    )
    explanation = diag_response.choices[0].message.content or ""
    
    # A small delay to be kind to the API
    time.sleep(0.5)

    # --- Call 2: Generate the Fix ---
    fix_messages = diag_messages + [
        {"role": "assistant", "content": explanation},
        {"role": "user", "content": FIX_INSTRUCTION}
    ]
    
    fix_response = client.chat.completions.create(
        model=model_cfg.model_name,
        messages=fix_messages,
        temperature=model_cfg.temperature,
        max_tokens=200, # A smaller token limit for the fix is usually sufficient
        timeout=model_cfg.timeout_seconds,
    )
    fix_suggestion = fix_response.choices[0].message.content or ""
            
    return explanation, fix_suggestion