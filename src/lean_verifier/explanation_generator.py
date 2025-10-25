# src/lean_verifier/explanation_generator.py

from lean_verifier.llm_zoo import ChatGPTInstance, GeminiInstance
from typing import Tuple, List, Dict, Any
import time

from lean_verifier.config import settings
from .config import Settings
from .data_models import AnnotatedProof

# --- SET 1: DEFAULT MODE PROMPTS ---
# Used when no (or incomplete) mutation metadata is present

DEFAULT_SYSTEM_PROMPT = (
    "You are a Lean 4 programmer diagnosing one failing proof. "
    "Assume you ONLY see the incorrect proof text, the infoview state near the failure, "
    "and Lean’s error message."
)

DEFAULT_DIAGNOSIS_INSTRUCTION = (
    "Explain why this single Lean proof fails, without proposing code.\n"
    "Return a compact, evidence-based diagnosis that only uses the provided "
    "incorrect proof snippet, infoview state, and Lean error.\n\n"
    "Output format (strict):\n"
    "1) Cause (one sentence): <what went wrong>\n"
    "2) Why it fails (≤2 sentences): <link the proof's content to the specific error class>"
)

DEFAULT_FIX_INSTRUCTION = (
    "Briefly explain how to fix this error at a high level (no code). "
    "Focus on what the error message and proof state imply is missing or incorrect."
)

# --- SET 2: THEOREM MUTATION MODE PROMPTS ---
# Used ONLY when all six mutation metadata fields are present

MUTATION_SYSTEM_PROMPT = (
    "You are a Lean 4 programmer diagnosing one failing proof.\n"
    "You will see the incorrect proof, its state/error, and a 'cheatsheet' of metadata "
    "detailing the intended (correct) theorem versus the one that was substituted (incorrect).\n"
    "Your task is to use this metadata to explain the failure. Write as if you deduced "
    "the problem, but use the metadata to inform your conclusion."
)

MUTATION_DIAGNOSIS_INSTRUCTION = (
    "You have been provided with metadata on the *intended* vs. *used* theorems. "
    "Use this to explain why the proof fails. Do not propose code.\n\n"
    "Output format (strict):\n"
    "1) Cause (one sentence): Identify that the wrong theorem was used "
    "(e.g., Used_Name instead of Intended_Name).\n"
    "2) Why it fails (≤2 sentences): Explain *why* the substituted theorem is incorrect. "
    "Focus on the type mismatch, unmet preconditions, or incorrect namespace, "
    "linking it to the specific Lean error."
)

MUTATION_FIX_INSTRUCTION = (
    "Briefly explain how to fix at a high level (no code). "
    "Reference the *intended* theorem (from the metadata) and describe the *shape* "
    "of any side conditions or namespace issues that must be resolved to use it correctly."
)


def _build_context_block(proof: AnnotatedProof) -> str:
    """
    Builds the rich context block. Conditionally includes metadata
    only if all mutation-related fields are present.
    """
    
    # Build the minimal, guaranteed parts of the context
    parts = [
        "**Context:**",
        f"Incorrect proof:\n```lean\n{proof.incorrect_proof}\n```",
        f"Infoview state:\n{proof.state_at_error or '(empty)'}",
        f"Lean error:\n{proof.error or '(empty)'}",
    ]
    
    # Check for "Theorem Mutation Mode" (all-or-nothing)
    if (proof.correct_name is not None and
        proof.incorrect_name is not None and
        proof.correct_formal is not None and
        proof.incorrect_formal is not None and
        proof.correct_informal is not None and
        proof.incorrect_informal is not None):
        
        # If all fields are present, add the rich metadata with the new header
        extras = [
            "\n**Mutation Metadata (Cheatsheet):**",
            "This metadata identifies the intended substitution for this proof.\n",
            f"Intended (correct) theorem name: {proof.correct_name}",
            f"Used (incorrect) theorem name: {proof.incorrect_name}",
            f"Intended formal statement:\n{proof.correct_formal}",
            f"Used formal statement:\n{proof.incorrect_formal}",
            f"Intended informal description: {proof.correct_informal}",
            f"Used informal description: {proof.incorrect_informal}",
        ]
        parts.append("\n".join(extras))
    
    # If the check fails (Default Mode), 'parts' simply doesn't get
    # the extra metadata, and the function proceeds.
    return '\n'.join(parts)
    


def generate_explanation(proof: AnnotatedProof, model_settings: Settings) -> Tuple[str, str]:
    """
    Calls the Gemini API in a two-step process to generate a detailed
    explanation and fix for a given annotated proof.
    """
    # Decide which set of prompts to use
    
    # Check for "Theorem Mutation Mode" (all-or-nothing)
    if (proof.correct_name is not None and
        proof.incorrect_name is not None and
        proof.correct_formal is not None and
        proof.incorrect_formal is not None and
        proof.correct_informal is not None and
        proof.incorrect_informal is not None):
        
        system_prompt = MUTATION_SYSTEM_PROMPT
        diagnosis_instruction = MUTATION_DIAGNOSIS_INSTRUCTION
        fix_instruction = MUTATION_FIX_INSTRUCTION
    else:
        # Fall back to Default Mode
        system_prompt = DEFAULT_SYSTEM_PROMPT
        diagnosis_instruction = DEFAULT_DIAGNOSIS_INSTRUCTION
        fix_instruction = DEFAULT_FIX_INSTRUCTION

    # This now builds a conditional context
    context = _build_context_block(proof) 

    chat = GeminiInstance(settings.gemini_explanation_model, system_prompt)
    # --- Call 1: Generate the Diagnosis ---
    explanation = chat.querry(f"{diagnosis_instruction}\n\n{context}")
    
    # A small delay to be kind to the API
    time.sleep(0.5)

    # --- Call 2: Generate the Fix ---
    fix_suggestion = chat.querry(fix_instruction)
            
    return explanation, fix_suggestion