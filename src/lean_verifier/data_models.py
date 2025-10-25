# src/lean_verifier/data_models.py

import hashlib
import json
from dataclasses import dataclass, asdict 
from pathlib import Path
from typing import Optional 

@dataclass
class LeanFile:
    """Represents a single Lean source file and its content."""
    relative_path: str
    content: str
    src_hash: str

    @classmethod
    def from_path(cls, file_path: Path, source_root: Path):
        content = file_path.read_text(encoding="utf-8")
        relative_path = str(file_path.relative_to(source_root))
        src_hash = hashlib.sha256(content.encode('utf-8')).hexdigest()
        return cls(relative_path=relative_path, content=content, src_hash=src_hash)

    def to_dict(self):
        return {
            "path": self.relative_path,
            "text": self.content,
            "src_hash": self.src_hash
        }


@dataclass
class ProofPair:
    """Represents a pair of a correct and an incorrect Lean proof."""
    path: str
    correct_proof: str
    incorrect_proof: str
    
    # These are optional to support different generation modes.
    theorem: Optional[str] = None
    src_hash: Optional[str] = None
    correct_name: Optional[str] = None
    incorrect_name: Optional[str] = None
    correct_formal: Optional[str] = None
    incorrect_formal: Optional[str] = None
    correct_informal: Optional[str] = None
    incorrect_informal: Optional[str] = None

    @classmethod
    def from_dict(cls, data: dict):
        """Factory method to create a ProofPair from a dictionary."""
        return cls(**data)

    def to_dict(self):
        """Converts the instance back to a dictionary."""
        return asdict(self)

@dataclass
class AnnotatedProof(ProofPair):
    """
    Represents an incorrect proof that has been annotated with error
    information from the Lean server. Inherits from ProofPair.
    """
    error: Optional[str] = None
    line_at_error: Optional[str] = None
    state_at_error: Optional[str] = None

    @classmethod
    def from_dict(cls, data: dict):
        """
        Factory method to create an AnnotatedProof from a dictionary.
        This handles legacy keys with spaces.
        """
        if "line at error" in data:
            data["line_at_error"] = data.pop("line at error")
        if "state at error" in data:
            data["state_at_error"] = data.pop("state at error")
        
        return cls(**data)


@dataclass
class ExplainedProof(AnnotatedProof):
    """
    Represents an annotated proof that has been explained by an AI.
    Inherits from AnnotatedProof.
    """
    explanation: Optional[str] = None
    fix_suggestion: Optional[str] = None