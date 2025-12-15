#!/usr/bin/env bash

# Concatenate files named <base><number>.jsonl in a directory into <base>.jsonl.

set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <base_name> <directory_or_path>" >&2
  exit 1
fi

base_name="$1"
input_path="$2"

if [[ -d "$input_path" ]]; then
  search_dir="$input_path"
elif [[ -f "$input_path" ]]; then
  search_dir="$(dirname "$input_path")"
else
  echo "Error: '$input_path' is not a directory or file." >&2
  exit 1
fi

# Normalize directory path without trailing slash.
search_dir="${search_dir%/}"
output_file="$search_dir/${base_name}.jsonl"

mapfile -d '' files < <(
  find "$search_dir" -maxdepth 1 -type f -regextype posix-extended \
    -regex ".*/${base_name}[0-9]+\.jsonl" -print0 | sort -z -V
)

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No files matching ${base_name}<number>.jsonl found in $search_dir" >&2
  exit 1
fi

cat "${files[@]}" > "$output_file"
echo "Wrote $((${#files[@]})) files into $output_file"
