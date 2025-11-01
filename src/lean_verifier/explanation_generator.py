# src/lean_verifier/explanation_generator.py

from typing import Tuple
import json
import re
from abc import ABC, abstractmethod

from lean_verifier.llm_zoo import GeminiInstance  
from .config import Settings
from .data_models import AnnotatedProof
from lean_verifier.config import settings


class ExplanationStrategy(ABC):
    """
    Abstract base class for an explanation strategy.
    Each strategy defines how to build the prompt and parse the response.
    """
    
    @abstractmethod
    def get_system_prompt(self) -> str:
        """Returns the static system prompt for this strategy."""
        pass

    @abstractmethod
    def get_context(self, proof: AnnotatedProof) -> str:
        """Builds the context block for the LLM."""
        pass
    
    @abstractmethod
    def get_instruction(self, proof: AnnotatedProof) -> str:
        """Builds the specific instruction block for the LLM."""
        pass

    @abstractmethod
    def parse_response(self, raw: str, proof: AnnotatedProof) -> Tuple[str, str]:
        """Parses the LLM's raw response and provides fallbacks."""
        pass



class DefaultStrategy(ExplanationStrategy):
    """
    The default strategy for proofs that don't match any special case.
    Assumes a general, unknown failure.
    """
    
    def get_system_prompt(self) -> str:
        return (
            "You are a Lean 4 programmer diagnosing one failing proof. "
            "Assume you ONLY see the incorrect proof text, the infoview state near the failure, "
            "and Lean’s error message."
        )

    def get_context(self, proof: AnnotatedProof) -> str:
        return "\n".join([
            "**Context:**",
            f"Incorrect proof:\n```lean\n{proof.incorrect_proof}\n```",
            f"Infoview state:\n{proof.state_at_error or '(empty)'}",
            f"Lean error:\n{proof.error or '(empty)'}",
        ])

    def get_instruction(self, proof: AnnotatedProof) -> str:
        return (
            "Explain why this proof fails using only the snippet, infoview state, and error.\n\n"
            "Return ONLY one JSON object with exactly these two fields:\n"
            "{\n"
            '  "explanation": "1–3 sentences explaining the concrete reason the proof fails",\n'
            '  "fix_suggestion": "1 sentence with a high-level fix (no code); '
            "}\n"
            "No code blocks. No extra fields. Both fields must be non-empty."
        )

    def parse_response(self, raw: str, proof: AnnotatedProof) -> Tuple[str, str]:
        exp, fix = _parse_lenient_two_fields(raw)
        
        if not exp:
            exp = (
                "The proof fails due to a mismatch between the goal and the facts/tactics used, "
                "as indicated by the error and infoview state."
            )
        if not fix:
            fix = "Adjust the tactic or theorem usage to match the goal’s type and the side conditions implied by the error."
        
        return exp, fix


class MutationStrategy(ExplanationStrategy):
    """
    Strategy for proofs that *are* known theorem substitutions.
    Uses the "cheatsheet" metadata to give the LLM full context.
    """

    def get_system_prompt(self) -> str:
        return (
            "You are a Lean 4 programmer diagnosing one failing proof.\n"
            "You will see the incorrect proof, its state/error, and a 'cheatsheet' of metadata "
            "detailing the intended (correct) theorem versus the one that was substituted (incorrect).\n"
            "Use this metadata to explain the failure."
        )
    
    def get_context(self, proof: AnnotatedProof) -> str:
        # Start with the same context as the DefaultStrategy
        base_context = DefaultStrategy().get_context(proof)
        
        # Add additional stuff
        metadata_parts = [
            "\n**Mutation Metadata (Cheatsheet):**",
            "This metadata identifies the intended substitution for this proof.\n",
            f"Intended (correct) theorem name: {proof.correct_name}",
            f"Used (incorrect) theorem name: {proof.incorrect_name}",
            f"Intended formal statement:\n{proof.correct_formal}",
            f"Used formal statement:\n{proof.incorrect_formal}",
            f"Intended informal description: {proof.correct_informal}",
            f"Used informal description: {proof.incorrect_informal}"
        ]
        return base_context + "\n" + "\n".join(metadata_parts)

    def get_instruction(self, proof: AnnotatedProof) -> str:
        # The instruction can now safely assume rest of mutation metadata is present
        return (
            "Explain why the proof fails by contrasting the incorrect vs intended theorem.\n\n"
            "Return ONLY one JSON object with exactly these two fields:\n"
            "{\n"
            '  "explanation": "1–3 sentences explaining the concrete reason the proof fails",\n'
            '  "fix_suggestion": "Start with: Replace `'
            + str(proof.incorrect_name) + "` with `" + str(proof.correct_name) +
            "`, and briefly say why that resolves the mismatch\"\n"
            "}\n"
            "No code blocks. No extra fields. Both fields must be non-empty."
        )

    def parse_response(self, raw: str, proof: AnnotatedProof) -> Tuple[str, str]:
        exp, fix = _parse_lenient_two_fields(raw)
        
        if not exp:
            exp = "The proof fails because the used theorem's statement does not match the goal."
        if not fix:
            fix = (
                f"Replace `{proof.incorrect_name}` with `{proof.correct_name}`, which aligns with the goal's type/assumptions."
            )
        
        return exp, fix


def _has_mutation_metadata(p: AnnotatedProof) -> bool:
    """Helper function to check for mutation data."""
    return all([
        p.correct_name is not None,
        p.incorrect_name is not None,
        p.correct_formal is not None,
        p.incorrect_formal is not None,
        p.correct_informal is not None,
        p.incorrect_informal is not None,
    ])

def choose_strategy(proof: AnnotatedProof) -> ExplanationStrategy:
    """
    Inspects the proof and selects the appropriate explanation strategy.
    This is the *only* place you need to add logic for new strategies.
    """
    if _has_mutation_metadata(proof):
        return MutationStrategy()
    
    # --- ADD NEW STRATEGIES HERE ---
    
    else:
        return DefaultStrategy()



async def generate_explanation(proof: AnnotatedProof, model_settings: Settings=None) -> Tuple[str, str]:
    """
    Single-call flow:
      1. Choose the correct strategy (Default, Mutation, etc.).
      2. Use the strategy to build the system prompt, context, and instruction.
      3. Make one model call.
      4. Use the strategy to parse the response.
    """
    # 1. Choose strategy
    strategy = choose_strategy(proof)
    
    # 2. Build prompt components
    system_prompt = strategy.get_system_prompt()
    context = strategy.get_context(proof)
    instruction = strategy.get_instruction(proof)
    
    user_prompt = f"{instruction}\n\n{context}"

    # 3. Make model call
    chat = GeminiInstance(settings.gemini_explanation_model, system_prompt)
    raw = await chat.querry(user_prompt) 

    # 4. Parse response
    explanation, fix_suggestion = strategy.parse_response(raw, proof)
    return explanation, fix_suggestion


def _parse_lenient_two_fields(raw: str) -> Tuple[str, str]:
    """
    A simple, lenient parser.
    (This function no longer needs a proof object, as fallbacks
     are handled by the strategies themselves).
    """
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
    
    return explanation, fix