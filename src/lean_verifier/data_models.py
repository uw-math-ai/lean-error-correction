# src/lean_verifier/data_models.py

import hashlib
import json
from dataclasses import dataclass, asdict 
from pathlib import Path

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
    theorem: str
    src_hash: str
    correct_proof: str
    incorrect_proof: str
    correct_name: str
    incorrect_name: str
    correct_formal: str
    incorrect_formal: str
    correct_informal: str
    incorrect_informal: str

    @classmethod
    def from_dict(cls, data: dict):
        """Factory method to create a ProofPair from a dictionary."""
        return cls(**data)

    def to_dict(self):
        """Converts the instance back to a dictionary."""
        return asdict(self)