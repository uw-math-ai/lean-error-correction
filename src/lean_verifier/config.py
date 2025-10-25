# src/lean_verifier/config.py
from typing import Dict
import tomli
from pathlib import Path
from dataclasses import dataclass, field

PROJECT_ROOT = Path(__file__).parent.parent.parent

@dataclass
class ExplanationModelSettings:
    """Holds settings for the AI model used for generating explanations."""
    model_name: str
    temperature: float
    max_tokens: int
    timeout_seconds: int

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
    explained_proofs_file: Path
    sft_dataset_file: Path
    line_mutation_input_file: Path
    annotated_lme_proofs_file: Path
    excluded_lme_proofs_file: Path
    gemini_explanation_model: str
    dubious_proofs_file: Path
    dubious_filter_input_file: Path
    line_mutation_pairs_file: Path
    api_keys: Dict[str, str]
    explanation_model: ExplanationModelSettings = field(default_factory=dict)

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
    
    # This line was missing, causing the NameError. It's now fixed.
    model_config_data = data.get('tool', {}).get('lean_verifier', {}).get('explanation_model', {})
    
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
        explained_proofs_file=PROJECT_ROOT / config_data['explained_proofs_file'],
        line_mutation_input_file=PROJECT_ROOT / config_data['line_mutation_input_file'],
        dubious_proofs_file = PROJECT_ROOT / config_data['dubious_proofs_file'],
        dubious_filter_input_file=PROJECT_ROOT / config_data['dubious_filter_input_file'],
        line_mutation_pairs_file=PROJECT_ROOT / config_data['line_mutation_pairs_file'],
        annotated_lme_proofs_file=PROJECT_ROOT / config_data['annotated_lme_proofs_file'],
        excluded_lme_proofs_file=PROJECT_ROOT / config_data['excluded_lme_proofs_file'],
        gemini_explanation_model=config_data['gemini_explanation_model'],
        sft_dataset_file=PROJECT_ROOT / config_data['sft_dataset_file'],
        api_keys=data.get('tool', {}).get('lean_verifier', {}).get('api_keys', {}),
        explanation_model=ExplanationModelSettings(
            model_name=model_config_data.get('model_name', 'gpt-4o-mini'),
            temperature=float(model_config_data.get('temperature', 0.2)),
            max_tokens=int(model_config_data.get('max_tokens', 600)),
            timeout_seconds=int(model_config_data.get('timeout_seconds', 60))
        )
    )

settings = load_settings()