# src/lean_verifier/theorem_prover.py

import re
import tempfile
import os
from typing import List, Dict
from lean_interact import AutoLeanServer, FileCommand, LeanREPLConfig

# This is the Lean metaprogram that checks if identifiers are theorems. May want to get help from the people that actually know metaprogramming 
PROBE_TEMPLATE = """
import Mathlib
open Lean Meta IO

def mkName (s : String) : Name :=
  s.splitOn "." |>.foldl (fun n seg => Name.str n seg) Name.anonymous

def findWith (env : Environment) (bases : List Name) (n : Name) : Option ConstantInfo :=
  (n :: bases.map (· ++ n)).findSome? (env.find?)

#eval MetaM.run' do
  let env ← getEnv
  let bases : List Name := [`BigOperators, `Real, `Nat, `Topology, `Rat]
  let names := [{}]
  for raw in names do
    let n := mkName raw
    let isThm := match findWith env bases n with
      | some info => info.isThm
      | none      => false
    -- CRITICAL FIX: Reverted to string concatenation to avoid Python format errors.
    IO.println (raw ++ " " ++ toString isThm)
"""

# A simple regex to find potential Lean identifiers.
IDENT_RE = re.compile(r"(?:[A-Za-z0-9_']+|[^\W\d_])+")

def extract_identifiers_from_text(text: str) -> List[str]:
    """Extracts candidate identifiers from a block of Lean source text."""
    lines = text.splitlines()
    body = "\n".join(lines[1:]) if len(lines) > 1 else ""
    return sorted(set(IDENT_RE.findall(body)))

def _build_probe_text(names: List[str]) -> str:
    """Renders the list of names into the Lean probe template."""
    return PROBE_TEMPLATE.format(", ".join(f"\"{n}\"" for n in names))

def _parse_probe_output(messages_text: str) -> Dict[str, bool]:
    """Parses lines like '<name> true' or '<name> false' into a dictionary."""
    out: Dict[str, bool] = {}
    for line in messages_text.splitlines():
        s = line.strip()
        if not s or " " not in s:
            continue
        name, tail = s.rsplit(" ", 1)
        if tail == "true":
            out[name] = True
        elif tail == "false":
            out[name] = False
    return out

def classify_identifiers(config: LeanREPLConfig, unknown_ids: List[str]) -> Dict[str, bool]:
    """
    Takes a list of unknown identifiers, runs them through a Lean metaprogram
    in chunks, and returns a dictionary classifying them as theorems or not.
    """
    results: Dict[str, bool] = {}
    chunk_size = 500
    print(f"Classifying {len(unknown_ids)} new identifiers in chunks of {chunk_size}...")
    server = AutoLeanServer(config)
    
    for i in range(0, len(unknown_ids), chunk_size):
        chunk = unknown_ids[i : i + chunk_size]
        probe_text = _build_probe_text(chunk)
        
        temp_file_path = None
        try:
            with tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.lean', encoding='utf-8') as tf:
                tf.write(probe_text)
                temp_file_path = tf.name

            command = FileCommand(path=temp_file_path)
            result = server.run(command)
            
            output_text = "\n".join([msg.data for msg in result.messages if msg.data])
            results.update(_parse_probe_output(output_text))
            
            print(f"  ...processed chunk {i//chunk_size + 1}, found {len(results)} theorems so far.")
            
        finally:
            if temp_file_path and os.path.exists(temp_file_path):
                os.remove(temp_file_path)
                
    return results


def select_theorems_from_text(text: str, theorem_cache: Dict[str, bool]) -> List[str]:
    """
    Extracts all identifiers from a text and filters them, keeping only
    those that are marked as theorems in the cache.
    """
    identifiers = extract_identifiers_from_text(text)
    theorems = [name for name in identifiers if theorem_cache.get(name) is True]
    return sorted(theorems)