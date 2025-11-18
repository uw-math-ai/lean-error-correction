# scripts/error_testing/evaluate_mutation.py

from __future__ import annotations

import argparse
import json
import multiprocessing as mp
import os
import re
import sys
import tempfile
from pathlib import Path
from typing import Optional

project_root = Path(__file__).parent.parent.parent
src_path = project_root / "src"
if str(src_path) not in sys.path:
    sys.path.append(str(src_path))

from lean_verifier.config import settings
from lean_verifier.data_models import ProofPair
from lean_interact import AutoLeanServer, FileCommand, LeanREPLConfig, TempRequireProject

STATEMENT_SPLIT_RE = re.compile(r":=\s*by", re.IGNORECASE)
SYNTAX_PATTERNS = (
    "invalid syntax",
    "invalid command",
    "invalid input",
    "unexpected token",
    "unexpected identifier",
    "unexpected end of input",
    "unterminated",
    "parse error",
)
SORRY_PATTERNS = (
    "tactic 'sorry'",
    "uses sorry",
    "contains sorry",
    "declaration uses sorry",
    "declaration contains sorry",
    "sorry has been left",
)


def _extract_statement(proof: str) -> str:
    """Return the theorem statement (portion before the first `by`)."""
    if not proof:
        return ""
    parts = STATEMENT_SPLIT_RE.split(proof, maxsplit=1)
    return parts[0].strip() if parts else proof.strip()


def _pos_to_dict(pos) -> Optional[dict]:
    if pos is None:
        return None
    return {
        "line": getattr(pos, "line", None),
        "column": getattr(pos, "column", None),
    }


def _serialize_message(msg) -> dict:
    """Convert a LeanInteract message to a JSON-serializable dict."""
    payload = {
        "severity": getattr(msg, "severity", ""),
        "data": getattr(msg, "data", ""),
        "start": _pos_to_dict(getattr(msg, "start_pos", None)),
        "end": _pos_to_dict(getattr(msg, "end_pos", None)),
    }
    caption = getattr(msg, "caption", None)
    if caption:
        payload["caption"] = caption
    return payload


def _is_syntax_error(message: str) -> bool:
    lower = message.lower()
    return any(pattern in lower for pattern in SYNTAX_PATTERNS)


def _is_sorry_error(message: str) -> bool:
    lower = message.lower()
    return "sorry" in lower or any(pattern in lower for pattern in SORRY_PATTERNS)


def _evaluate_pair(config: LeanREPLConfig, proof_pair: ProofPair) -> dict:
    """Run Lean on the incorrect proof and record diagnostics."""
    theorem_matches = (
        _extract_statement(proof_pair.correct_proof)
        == _extract_statement(proof_pair.incorrect_proof)
    )

    output = proof_pair.to_dict()
    output["theorem_matches"] = theorem_matches

    temp_file_path = None
    try:
        server = AutoLeanServer(config)
        code = f"import Mathlib\n\n{proof_pair.incorrect_proof}"
        print(code)

        with tempfile.NamedTemporaryFile(
            mode="w", delete=False, suffix=".lean", encoding="utf-8"
        ) as tf:
            tf.write(code)
            temp_file_path = tf.name

        result = server.run(FileCommand(path=temp_file_path))
        messages = [_serialize_message(msg) for msg in result.messages]
        errors = [msg for msg in result.messages if getattr(msg, "severity", "") == "error"]
        has_error = bool(errors)
        has_interesting_errors = has_error and not any(
            _is_syntax_error(getattr(msg, "data", ""))
            or _is_sorry_error(getattr(msg, "data", ""))
            for msg in errors
        )

        output.update(
            {
                "has_error": has_error,
                "has_interesting_errors": has_interesting_errors,
                "messages": messages,
                "is_good_data": theorem_matches and has_error and has_interesting_errors,
            }
        )
        return output
    except Exception as exc:  # pragma: no cover - defensive logging
        output.update(
            {
                "has_error": False,
                "has_interesting_errors": False,
                "messages": [
                    {
                        "severity": "internal-error",
                        "data": str(exc),
                    }
                ],
                "is_good_data": False,
            }
        )
        return output
    finally:
        if temp_file_path and os.path.exists(temp_file_path):
            os.remove(temp_file_path)


def _worker_entry(args):
    config, proof_pair = args
    return _evaluate_pair(config, proof_pair)


def evaluate_mutation(mutations_path: str | Path, output_path: Optional[str | Path] = None) -> Path:
    """
    Evaluate mutated proofs stored in JSONL format and enrich them with diagnostics.
    """
    input_path = Path(mutations_path)
    if not input_path.exists():
        raise FileNotFoundError(f"Input file '{input_path}' does not exist.")

    proof_pairs: list[ProofPair] = []
    with input_path.open("r", encoding="utf-8") as source:
        for line in source:
            line = line.strip()
            if not line:
                continue
            proof_pairs.append(ProofPair.from_dict(json.loads(line)))

    if not proof_pairs:
        raise ValueError(f"No proof pairs found in '{input_path}'.")

    destination = (
        Path(output_path)
        if output_path is not None
        else input_path.with_name(f"{input_path.stem}_evaluated.jsonl")
    )
    destination.parent.mkdir(parents=True, exist_ok=True)

    print(f"Evaluating {len(proof_pairs)} mutated proofs from {input_path}...")

    config = LeanREPLConfig(
        project=TempRequireProject(lean_version=settings.lean_version, require="mathlib")
    )

    print("Lean evironment setup successfully, starting to process mutated proofs...")

    ctx = mp.get_context("spawn")
    tasks = [(config, pair) for pair in proof_pairs]

    with ctx.Pool(processes=settings.num_processes) as pool, destination.open(
        "w", encoding="utf-8" # is this all good? shouldn't it be 'a'?
    ) as outfile:
        for record in pool.imap(_worker_entry, tasks):
            outfile.write(json.dumps(record, ensure_ascii=False) + "\n")

    print(f"Wrote evaluation results to {destination}.")
    return destination


def _parse_args():
    parser = argparse.ArgumentParser(description="Evaluate mutated Lean proofs.")
    parser.add_argument(
        "input_file",
        type=Path,
        help="Path to the JSONL file produced by mutate_workbook.",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=None,
        help="Optional destination JSONL path (defaults to <input>_evaluated.jsonl).",
    )
    return parser.parse_args()


if __name__ == "__main__":
    args = _parse_args()
    evaluate_mutation(args.input_file, args.output)
