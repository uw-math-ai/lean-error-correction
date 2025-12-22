# Run with:
#   python -m scripts.annotate_jsonl_generic --input input.jsonl --output annotated.jsonl --code-field incorrect_proof

import argparse
import json
import sys
from pathlib import Path

from lean_verifier.config import settings
from lean_verifier.core import get_state_before_first_error
from lean_interact import LeanREPLConfig, TempRequireProject, AutoLeanServer


def annotate_code(server: AutoLeanServer, lean_code: str) -> dict:
    """Annotate a Lean snippet with error location and proof state."""
    analysis = get_state_before_first_error(lean_code, server)
    error = analysis.get("error")

    # Skip clean files to mirror annotate_proofs behavior.
    if error is None:
        return {
            "annotation_status": "skipped_no_error",
            "error": None,
            "line": None,
            "col": None,
            "line_at_error": None,
            "state_at_error": None,
            "state_before": None,
            "state_after": None,
        }

    line_user = analysis.get("line")
    col_user = analysis.get("col")
    state_before = analysis.get("state_before")
    state_after = analysis.get("state_after")

    line_text = ""
    if line_user is not None:
        lines = lean_code.splitlines()
        if 1 <= line_user <= len(lines):
            line_text = lines[line_user - 1].strip()

    state = state_before or state_after or "Could not retrieve proof state."

    return {
        "annotation_status": "pass" if error is None else "error",
        "error": error,
        "line": line_user,
        "col": col_user,
        "line_at_error": line_text if error else None,
        "state_at_error": state if error else None,
        "state_before": state_before,
        "state_after": state_after,
    }


def process_file(input_path: Path, output_path: Path, code_field: str) -> None:
    """Stream over JSONL input, annotate Lean code from the chosen field, and write JSONL output."""
    if not input_path.exists():
        print(f"Error: input file not found at '{input_path}'.", file=sys.stderr)
        return

    config = LeanREPLConfig(project=TempRequireProject(lean_version=settings.lean_version, require="mathlib"))
    server = AutoLeanServer(config)

    processed = 0
    annotated = 0
    skipped = 0

    with input_path.open("r", encoding="utf-8") as infile, output_path.open("w", encoding="utf-8") as outfile:
        for line in infile:
            processed += 1
            try:
                record = json.loads(line)
            except json.JSONDecodeError:
                skipped += 1
                continue

            lean_code = record.get(code_field)
            if not isinstance(lean_code, str):
                record["annotation_status"] = "skipped_missing_code"
                skipped += 1
            else:
                try:
                    annotation = annotate_code(server, lean_code)
                    record.update(annotation)
                    if annotation.get("annotation_status") == "skipped_no_error":
                        skipped += 1
                    else:
                        annotated += 1
                except Exception as exc:  # pragma: no cover
                    record["annotation_status"] = "error_runtime"
                    record["annotation_error"] = str(exc)
                    skipped += 1

            outfile.write(json.dumps(record, ensure_ascii=False) + "\n")

    print(f"Processed: {processed}")
    print(f"Annotated: {annotated}")
    print(f"Skipped: {skipped}")
    print(f"Output written to {output_path}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Annotate Lean code from any JSONL file by adding error location and proof state."
    )
    parser.add_argument("--input", type=Path, required=True, help="Path to input JSONL file.")
    parser.add_argument("--output", type=Path, required=True, help="Path to write annotated JSONL.")
    parser.add_argument(
        "--code-field",
        type=str,
        default="incorrect_proof",
        help="Key in each JSON object that contains the Lean code to annotate.",
    )

    args = parser.parse_args()
    process_file(args.input, args.output, args.code_field)


if __name__ == "__main__":
    main()
