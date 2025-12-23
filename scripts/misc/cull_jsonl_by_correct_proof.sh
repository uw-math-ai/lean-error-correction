#!/usr/bin/env bash

# Filter a JSONL file by removing entries whose correct_proof appears as text in another JSONL file.

set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <primary_jsonl> <reference_jsonl>" >&2
  exit 1
fi

primary="$1"
reference="$2"

if [[ ! -f "$primary" ]]; then
  echo "Error: primary file '$primary' not found." >&2
  exit 1
fi

if [[ ! -f "$reference" ]]; then
  echo "Error: reference file '$reference' not found." >&2
  exit 1
fi

if [[ "$primary" == *.jsonl ]]; then
  output="${primary%.jsonl}_culled.jsonl"
else
  output="${primary}_culled"
fi

python3 - <<'PY' "$primary" "$reference" "$output"
import json
import sys
from pathlib import Path

primary_path = Path(sys.argv[1])
reference_path = Path(sys.argv[2])
output_path = Path(sys.argv[3])

def normalize(text: str) -> str:
    """Normalize newlines and trim so structurally identical proofs match."""
    return text.replace("\r\n", "\n").strip()

text_values = set()
with reference_path.open("r", encoding="utf-8") as ref_file:
    for line in ref_file:
        line = line.strip()
        if not line:
            continue
        try:
            obj = json.loads(line)
        except json.JSONDecodeError:
            print("json decode error")
            continue
        candidates = []
        txt = obj.get("text") or (obj.get("data").get("text") if obj.get("data") is not None else None)
        if isinstance(txt, str):
            candidates.append(txt)
        alt = obj.get("correct_proof") or (obj.get("data").get("correct_proof") if obj.get("data") is not None else None)
        if isinstance(alt, str):
            candidates.append(alt)
        for candidate in candidates:
            text_values.add(normalize(candidate))

filtered_lines = 0
kept_lines = 0
with primary_path.open("r", encoding="utf-8") as prim_file, \
        output_path.open("w", encoding="utf-8") as out_file:
    for line in prim_file:
        raw = line.rstrip("\n")
        if not raw.strip():
            continue
        try:
            obj = json.loads(raw)
        except json.JSONDecodeError:
            out_file.write(line)
            print("json decode error")
            kept_lines += 1
            continue
        correct = obj.get("text")
        alt = obj.get("correct_proof")
        if isinstance(correct, str) and normalize(correct) in text_values:
            filtered_lines += 1
            continue
        if isinstance(alt, str) and normalize(alt) in text_values:
            filtered_lines += 1
            continue
        out_file.write(line)
        kept_lines += 1

print(f"Wrote {kept_lines} entries to {output_path} (culled {filtered_lines})")
PY
