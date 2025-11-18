# src/lean_verifier/core.py

import os
import tempfile
import re
from typing import Optional, Tuple, Dict, Any, List

from lean_interact import AutoLeanServer, FileCommand, LeanREPLConfig, Command
from lean_interact.interface import (
    Command,
    CommandResponse,
    InfoTreeOptions,
    Message,
)
from .data_models import LeanFile, ProofPair

try:
    from .data_models import LeanFile, ProofPair  # noqa: F401
except Exception:  # pragma: no cover
    ProofPair = None  # type: ignore[assignment]

try:
    from .config import IMPORT_PREAMBLE as _CONFIG_PREAMBLE  # noqa: F401
    IMPORT_PREAMBLE = _CONFIG_PREAMBLE  # type: ignore[misc]
except Exception:  # pragma: no cover
    IMPORT_PREAMBLE = "import Mathlib\n\n"


# =============================================================================
# Utilities
# =============================================================================

def _full_code(user_code: str) -> str:
    if user_code.lstrip().startswith("import "):
        return user_code
    return IMPORT_PREAMBLE + user_code


def _preamble_lines() -> int:
    return IMPORT_PREAMBLE.count("\n")


def _user_to_server_line(line_user: int) -> int:
    return int(line_user) + _preamble_lines()


def _server_to_user_line(line_server: int) -> int:
    return int(line_server) - _preamble_lines()


def _pos(line: int, col: int) -> Tuple[int, int]:
    return (int(line), int(col))


def _le(a: Tuple[int, int], b: Tuple[int, int]) -> bool:
    return a[0] < b[0] or (a[0] == b[0] and a[1] <= b[1])


def _lt(a: Tuple[int, int], b: Tuple[int, int]) -> bool:
    return a[0] < b[0] or (a[0] == b[0] and a[1] < b[1])


def _norm(s: Optional[str]) -> Optional[str]:
    if s is None:
        return None
    return " ".join(s.split())


def _join_goals(lines: List[str]) -> Optional[str]:
    if not lines:
        return "no goals"
    return "\n".join(lines)


# =============================================================================
# Original File-Based Functions
# =============================================================================

def verify_lean_code(lean_code: str, server: AutoLeanServer) -> tuple[str, dict]:
    temp_file_path = None
    try:
        with tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.lean', encoding='utf-8') as tf:
            tf.write(_full_code(lean_code))
            temp_file_path = tf.name

        command = FileCommand(path=temp_file_path)
        result = server.run(command)
        error_messages = [msg.data for msg in result.messages if msg.severity == 'error']

        if not error_messages:
            return ('pass', result)
        else:
            return ('fail', result)
    finally:
        if temp_file_path and os.path.exists(temp_file_path):
            os.remove(temp_file_path)

def verify_lean_file(config: LeanREPLConfig, lean_file: LeanFile) -> tuple[str, dict]:
    temp_file_path = None
    try:
        server = AutoLeanServer(config)
        code_to_verify = _full_code(lean_file.content)

        with tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.lean', encoding='utf-8') as tf:
            tf.write(code_to_verify)
            temp_file_path = tf.name

        command = FileCommand(path=temp_file_path)
        result = server.run(command)
        error_messages = [msg.data for msg in result.messages if msg.severity == 'error']
        output_data = lean_file.to_dict()

        if not error_messages:
            return ('pass', output_data)
        else:
            output_data['errors'] = error_messages
            return ('fail', output_data)
    finally:
        if temp_file_path and os.path.exists(temp_file_path):
            os.remove(temp_file_path)

# =============================================================================
# Core Analysis Functions
# =============================================================================

def get_states_at_position(
    user_code: str,
    server: AutoLeanServer,
    *,
    line: int,
    col: int,
) -> Dict[str, Optional[str]]:
    full = _full_code(user_code)
    line = _user_to_server_line(line)
    target = _pos(line, col)

    # ----- Pass 1: infotree=tactics -----
    try:
        res = server.run(Command(cmd=full, infotree=InfoTreeOptions.tactics))
        if isinstance(res, CommandResponse) and res.infotree:
            best_exact_start = None
            best_exact_end = None
            best_cover = None
            best_pred = None

            def consider(node):
                nonlocal best_exact_start, best_exact_end, best_cover, best_pred
                if getattr(node, "kind", None) != "TacticInfo":
                    return
                n = getattr(node, "node", None)
                if n is None:
                    return
                stx = getattr(n, "stx", None)
                if stx is None or getattr(stx, "range", None) is None:
                    return
                rng = stx.range
                start = _pos(rng.start.line, rng.start.column)
                end = _pos(rng.finish.line, rng.finish.column)
                gb = _join_goals(getattr(n, "goals_before", []) or [])
                ga = _join_goals(getattr(n, "goals_after", []) or [])

                if target == start:
                    if best_exact_start is None or _le(best_exact_start[0], end):
                        best_exact_start = (end, gb, ga)
                if target == end:
                    if best_exact_end is None or _le(best_exact_end[0], end):
                        best_exact_end = (end, gb, ga)
                if _le(start, target) and _le(target, end):
                    if best_cover is None or _le(best_cover[0], end):
                        best_cover = (end, gb, ga)
                elif _le(end, target):
                    if best_pred is None or _le(best_pred[0], end):
                        best_pred = (end, gb, ga)

            def walk(tree):
                consider(tree)
                for ch in getattr(tree, "children", []):
                    walk(ch)

            for t in res.infotree:
                walk(t)

            pick = best_exact_start or best_exact_end or best_cover or best_pred
            if pick is not None:
                _, gb, ga = pick
                gb = _norm(gb) if gb is not None else None
                ga = _norm(ga) if ga is not None else None

                if best_exact_start is pick:
                    return {"state_before": gb, "state_after": None}
                if best_exact_end is pick:
                    return {"state_before": None, "state_after": ga}
                return {"state_before": gb, "state_after": ga}
    except Exception:
        pass

    # ----- Pass 2: all_tactics fallback -----
    try:
        res2 = server.run(Command(cmd=full, all_tactics=True))
        if not isinstance(res2, CommandResponse):
            return {"state_before": None, "state_after": None}

        best_cover = None
        best_pred = None
        for t in res2.tactics:
            s = _pos(t.start_pos.line, t.start_pos.column)
            e = _pos(t.end_pos.line, t.end_pos.column)
            g = t.goals or ""
            if _le(s, target) and _le(target, e):
                if best_cover is None or _le(best_cover[0], e):
                    best_cover = (e, g)
            elif _le(e, target):
                if best_pred is None or _le(best_pred[0], e):
                    best_pred = (e, g)

        if best_cover is not None:
            g = _norm(best_cover[1]) if best_cover[1] else None
            return {"state_before": None, "state_after": g}
        if best_pred is not None:
            g = _norm(best_pred[1]) if best_pred[1] else None
            return {"state_before": g, "state_after": None}
    except Exception:
        pass

    return {"state_before": None, "state_after": None}


def get_state_before_first_error(
    user_code: str,
    server: AutoLeanServer,
) -> Dict[str, Optional[str]]:
    full = _full_code(user_code)
    res = server.run(Command(cmd=full))
    if not isinstance(res, CommandResponse):
        return {
            "error": "Server error",
            "line": None,
            "col": None,
            "state_before": None,
            "state_after": None,
        }

    errs = res.get_errors()
    if not errs:
        return {
            "error": None,
            "line": None,
            "col": None,
            "state_before": None,
            "state_after": None,
        }

    errs = sorted(errs, key=lambda m: (m.start_pos.line, m.start_pos.column))
    first = errs[0]
    line_user = _server_to_user_line(first.start_pos.line)
    col_user = first.start_pos.column
    states = get_states_at_position(user_code, server, line=line_user, col=col_user)
    return {
        "error": first.data,
        "line": line_user,
        "col": col_user,
        "state_before": states.get("state_before"),
        "state_after": states.get("state_after"),
    }

# =============================================================================
# Annotation Worker (REWRITTEN)
# =============================================================================

def annotate_proof_worker(config: LeanREPLConfig, proof_pair: ProofPair) -> tuple[str, dict]:
    try:
        server = AutoLeanServer(config)
        
        incorrect_code = proof_pair.incorrect_proof
        output_data = proof_pair.to_dict()

        analysis = get_state_before_first_error(incorrect_code, server)

        if analysis.get("error") is None:
            return ('skipped', {"reason": "no errors found"})

        line_user = analysis.get("line")
        col_user = analysis.get("col")
        
        state_before = analysis.get("state_before")
        state_after = analysis.get("state_after")
        
        # --- DIAGNOSTIC BLOCK REMOVED ---

        state = state_before or state_after or "Could not retrieve proof state."

        line_text = ""
        try:
            if line_user is not None:
                lines = incorrect_code.splitlines()
                if 1 <= line_user <= len(lines):
                    line_text = lines[line_user - 1].strip()
        except Exception:
            pass 

        output_data['error'] = analysis.get("error")
        output_data['line_at_error'] = line_text
        output_data['state_at_error'] = state
        output_data['line'] = line_user
        output_data['col'] = col_user
        
        return ('annotated', output_data)

    except Exception as e:
        return ('error', {"error": str(e)})