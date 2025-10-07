# src/lean_verifier/config.py
from typing import Dict
import tomli
from pathlib import Path
from dataclasses import dataclass

PROJECT_ROOT = Path(__file__).parent.parent.parent

@dataclass
class Settings:
    """Holds all configuration for the Lean Verifier pipeline."""
    lean_version: str
    source_dir: Path
    output_dir: Path
    num_processes: int
    theorem_cache_file: Path 
    theorem_pairs_file: Path 
    expanded_pairs_file: Path
    incorrect_proofs_file: Path
    annotated_proofs_file: Path
    excluded_proofs_file: Path

    api_keys: Dict[str, str]

    @property
    def pass_output_file(self) -> Path:
        return self.output_dir / "src_pass.jsonl"
        
    @property
    def fail_output_file(self) -> Path:
        return self.output_dir / "src_fail.jsonl"

def load_settings() -> Settings:
    """Loads settings from pyproject.toml."""
    pyproject_path = PROJECT_ROOT / "pyproject.toml"
    with open(pyproject_path, "rb") as f:
        data = tomli.load(f)
    
    config_data = data['tool']['lean_verifier']
    
    return Settings(
        lean_version=config_data['lean_version'],
        source_dir=PROJECT_ROOT / config_data['source_dir'],
        output_dir=PROJECT_ROOT / config_data['output_dir'],
        num_processes=int(config_data['num_processes']),
        theorem_cache_file=PROJECT_ROOT / config_data['theorem_cache_file'],
        theorem_pairs_file=PROJECT_ROOT / config_data['theorem_pairs_file'],
        expanded_pairs_file=PROJECT_ROOT / config_data['expanded_pairs_file'],
        incorrect_proofs_file=PROJECT_ROOT / config_data['incorrect_proofs_file'],
        annotated_proofs_file=PROJECT_ROOT / config_data['annotated_proofs_file'], 
        excluded_proofs_file=PROJECT_ROOT / config_data['excluded_proofs_file'],

        api_keys=data.get('tool', {}).get('lean_verifier', {}).get('api_keys', {})
    )

settings = load_settings()