
from __future__ import annotations

import asyncio
import inspect
import json
from pathlib import Path
from typing import Any, Callable, Optional

from lean_verifier.data_models import LeanFile, ProofPair

MutationFn = Callable[[str], Any]


def _resolve_result(result: Any) -> Any:
    """Synchronously resolve mutation results that may be awaitable."""
    if inspect.isawaitable(result):
        try:
            loop = asyncio.get_running_loop()
        except RuntimeError:
            return asyncio.run(result)
        raise RuntimeError(
            "mutation_fn returned an awaitable while an event loop is already running; "
            "call mutate_workbook from a synchronous context or await the coroutine yourself."
        )
    return result


def mutate_workbook(
    workbook_path: str | Path,
    mutation_fn: MutationFn,
    output_path: Optional[str | Path] = None,
) -> Path:
    """
    Apply ``mutation_fn`` to every Lean file found in ``workbook_path`` and store
    the results in a JSONL file.

    Each JSONL line contains the original Lean file metadata alongside the
    mutation output so the relationship between the two is explicit.

    Args:
        workbook_path: Path to a directory of Lean files or a single Lean file.
        mutation_fn: Callable that receives the file content and returns any
            serialisable mutation payload (synchronous or awaitable).
        output_path: Optional destination for the JSONL file. Defaults to
            ``<workbook>/mutations.jsonl`` or ``<file>_mutations.jsonl``.

    Returns:
        The path to the JSONL file that was written.

    Raises:
        FileNotFoundError: If ``workbook_path`` does not exist.
        ValueError: If no Lean files are found at the given path.
    """
    source = Path(workbook_path)
    if not source.exists():
        raise FileNotFoundError(f"Workbook path '{source}' does not exist.")

    if source.is_dir():
        lean_files = sorted(source.rglob("*.lean"))
        root = source
        default_output = source / "mutations.jsonl"
    elif source.is_file() and source.suffix == ".lean":
        lean_files = [source]
        root = source.parent
        default_output = root / f"{source.stem}_mutations.jsonl"
    else:
        raise ValueError(f"Workbook path '{source}' must be a directory or a .lean file.")

    if not lean_files:
        raise ValueError(f"No Lean files found under '{source}'.")

    output_file = Path(output_path) if output_path is not None else default_output
    output_file.parent.mkdir(parents=True, exist_ok=True)

    with output_file.open("w", encoding="utf-8") as destination:
        for file_path in lean_files:
            lean_file = LeanFile.from_path(file_path, root)
            mutation_payload = _resolve_result(mutation_fn(lean_file.content))
            proof_pair = ProofPair(
                path=lean_file.relative_path,
                correct_proof=lean_file.content,
                incorrect_proof=str(mutation_payload),
                src_hash=lean_file.src_hash,
            )
            destination.write(json.dumps(proof_pair.to_dict(), ensure_ascii=False) + "\n")

    return output_file


if __name__ == "__main__":
    mutate_workbook(
        workbook_path = "/mmfs1/home/sgvtc/lean-error-correction/workbook",
        mutation_fn = (lambda proof: proof + " editted by xvade (R)"))
