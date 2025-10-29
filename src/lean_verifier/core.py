# src/lean_verifier/core.py

import os
import tempfile
import re # <-- Added import
from lean_interact import AutoLeanServer, FileCommand, LeanREPLConfig, Command
from .data_models import LeanFile, ProofPair

def verify_lean_code(lean_code: str, server: AutoLeanServer) -> tuple[str, dict]:
    temp_file_path = None
    try:
        with tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.lean', encoding='utf-8') as tf:
            tf.write("import Mathlib\n\n" + lean_code)
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
    """
    Worker function that verifies a LeanFile object using the robust file-based method.
    This function is designed to be called in parallel.
    """
    temp_file_path = None
    try:
        server = AutoLeanServer(config)
        code_to_verify = f"import Mathlib\n\n{lean_file.content}"

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

def annotate_proof_worker(config: LeanREPLConfig, proof_pair: ProofPair) -> tuple[str, dict]:
    """
    Worker function for Step 5. It verifies an incorrect proof and, if it fails,
    annotates it with the error message and proof state.
    """
    temp_file_path = None
    try:
        server = AutoLeanServer(config)
        
        code_to_verify = f"import Mathlib\n\n{proof_pair.incorrect_proof}"

        with tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.lean', encoding='utf-8') as tf:
            tf.write(code_to_verify)
            temp_file_path = tf.name

        command = FileCommand(path=temp_file_path)
        result = server.run(command)
        
        error_messages = [msg for msg in result.messages if msg.severity == 'error']
        output_data = proof_pair.to_dict()

        if not error_messages:
            return ('excluded', output_data)
        else:
            first_error = error_messages[0]
            # The error line number from the server is 1-indexed
            error_line_num = first_error.start_pos.line
            
            lines = code_to_verify.strip().split('\n')
            
            # We want the proof state *before* the failing line.
            # The failing line is at index (error_line_num - 1).
            # So, we slice *up to* that index.
            partial_proof_lines = lines[:error_line_num - 1]
            
            # Get indentation from the last valid line to apply to 'sorry'
            indent = "  " # Default 2-space indent
            if partial_proof_lines:
                last_line = partial_proof_lines[-1]
                # Find all leading whitespace
                match = re.match(r"^(\s*)", last_line)
                if match:
                    # Use the same indentation as the line before
                    indent = match.group(1)

            command_str = "\n".join(partial_proof_lines) + f"\n{indent}sorry"
            
            # Use `Command` to run a string of code
            state_command = Command(cmd=command_str)
            state_result = server.run(state_command)

            state_at_error = state_result.sorries[0].goal if state_result.sorries else "Could not retrieve proof state."

            output_data['error'] = first_error.data
            # The line at the error is at index (error_line_num - 1)
            output_data['line_at_error'] = lines[error_line_num - 1].strip()
            output_data['state_at_error'] = state_at_error
            
            return ('annotated', output_data)
    except:
        return ('excluded', None)
            
    finally:
        if temp_file_path and os.path.exists(temp_file_path):
            os.remove(temp_file_path)