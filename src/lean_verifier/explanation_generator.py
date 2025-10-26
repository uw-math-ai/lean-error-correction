# src/lean_verifier/explanation_generator.py

from typing import Tuple
import json
import re

from lean_verifier.llm_zoo import ChatGPTInstance, GeminiInstance  
from .config import Settings
from .data_models import AnnotatedProof
from lean_verifier.config import settings



# Default mode: no assumption that the fix is a theorem swap.
DEFAULT_SYSTEM_PROMPT = (
    "You are a Lean 4 programmer diagnosing one failing proof. "
    "Assume you ONLY see the incorrect proof text, the infoview state near the failure, "
    "and Lean’s error message."
)

# Mutation mode: all six mutation metadata fields are present, so it *is* a theorem substitution case.
MUTATION_SYSTEM_PROMPT = (
    "You are a Lean 4 programmer diagnosing one failing proof.\n"
    "You will see the incorrect proof, its state/error, and a 'cheatsheet' of metadata "
    "detailing the intended (correct) theorem versus the one that was substituted (incorrect).\n"
    "Use this metadata to explain the failure."
)

def _has_mutation_metadata(p: AnnotatedProof) -> bool:
    """Return True iff all six mutation fields are present (all-or-nothing)."""
    return all([
        p.correct_name is not None,
        p.incorrect_name is not None,
        p.correct_formal is not None,
        p.incorrect_formal is not None,
        p.correct_informal is not None,
        p.incorrect_informal is not None,
    ])


def _build_context_block(proof: AnnotatedProof) -> str:
    """
    Build the context shown to the model. If all mutation metadata are present,
    include the cheatsheet section; otherwise include only the basic context.
    """
    parts = [
        "**Context:**",
        f"Incorrect proof:\n```lean\n{proof.incorrect_proof}\n```",
        f"Infoview state:\n{proof.state_at_error or '(empty)'}",
        f"Lean error:\n{proof.error or '(empty)'}",
    ]

    if _has_mutation_metadata(proof):
        parts.append("\n**Mutation Metadata (Cheatsheet):**")
        parts.append("This metadata identifies the intended substitution for this proof.\n")
        parts.append(f"Intended (correct) theorem name: {proof.correct_name}")
        parts.append(f"Used (incorrect) theorem name: {proof.incorrect_name}")
        parts.append(f"Intended formal statement:\n{proof.correct_formal}")
        parts.append(f"Used formal statement:\n{proof.incorrect_formal}")
        parts.append(f"Intended informal description: {proof.correct_informal}")
        parts.append(f"Used informal description: {proof.incorrect_informal}")

    return "\n".join(parts)


def _build_two_field_instruction(p: AnnotatedProof) -> str:
    """
    Build a single-call instruction that asks for exactly two JSON fields,
    adapted to the current mode (Default vs Mutation).
    """
    if _has_mutation_metadata(p):
        # Mutation mode: nudge the exact replacement; ask for brief reason.
        return (
            "Explain why the proof fails by contrasting the incorrect vs intended theorem.\n\n"
            "Return ONLY one JSON object with exactly these two fields:\n"
            "{\n"
            '  "explanation": "1–3 sentences explaining the concrete reason the proof fails",\n'
            '  "fix_suggestion": "Start with: Replace `'
            + p.incorrect_name + "` with `" + p.correct_name +
            "`, and briefly say why that resolves the mismatch\"\n"
            "}\n"
            "No code blocks. No extra fields. Both fields must be non-empty."
        )
    else:
        return (
            "Explain why this proof fails using only the snippet, infoview state, and error.\n\n"
            "Return ONLY one JSON object with exactly these two fields:\n"
            "{\n"
            '  "explanation": "1–3 sentences explaining the concrete reason the proof fails",\n'
            '  "fix_suggestion": "1 sentence with a high-level fix (no code); '
            "}\n"
            "No code blocks. No extra fields. Both fields must be non-empty."
        )


def _parse_lenient_two_fields(raw: str, p: AnnotatedProof) -> Tuple[str, str]:
    """
    A simple, lenient parser
    """
    # Try strict JSON first
    try:
        obj = json.loads(raw)
        if isinstance(obj, dict):
            exp = str(obj.get("explanation", "")).strip()
            fix = str(obj.get("fix_suggestion", "")).strip()
            if exp and fix:
                return exp, fix
    except Exception:
        pass

    # Regex fallback for quoted JSON-like blocks
    def _grab(key: str) -> str:
        m = re.search(rf'"{key}"\s*:\s*"([^"]+)"', raw)
        if m:
            return m.group(1).strip()
        # very lenient plain-text fallback
        m = re.search(rf'{key}\s*:\s*(.+)', raw)
        return m.group(1).strip() if m else ""

    explanation = _grab("explanation")
    fix = _grab("fix_suggestion")

    # Mode-appropriate fallbacks
    if not explanation:
        explanation = (
            "The proof fails due to a mismatch between the goal and the facts/tactics used, "
            "as indicated by the error and infoview state."
        )

    if not fix:
        if _has_mutation_metadata(p):
            fix = (
                f"Replace `{p.incorrect_name}` with `{p.correct_name}`, which aligns with the goal's type/assumptions."
            )
        else:
            fix = "Adjust the tactic or theorem usage to match the goal’s type and the side conditions implied by the error."

    return explanation, fix


def generate_explanation(proof: AnnotatedProof, model_settings: Settings) -> Tuple[str, str]:
    """
    Single-call flow:
      - Choose mode (Default vs Mutation).
      - Build a mode-specific instruction that asks for exactly two fields.
      - Provide the context block (and metadata if present).
      - Make one model call; leniently parse two fields; return them verbatim.
    """
    system_prompt = MUTATION_SYSTEM_PROMPT if _has_mutation_metadata(proof) else DEFAULT_SYSTEM_PROMPT
    instruction = _build_two_field_instruction(proof)
    context = _build_context_block(proof)

    chat = GeminiInstance(settings.gemini_explanation_model, system_prompt)
    raw = chat.querry(f"{instruction}\n\n{context}") 

    explanation, fix_suggestion = _parse_lenient_two_fields(raw, proof)
    return explanation, fix_suggestion
