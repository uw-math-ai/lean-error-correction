import os
import time
from lean_interact import (
    LeanREPLConfig,
    AutoLeanServer,
    TempRequireProject,
    Command
)

def verify_proof(server, lean_code: str):
    """
    Checks a given piece of Lean code for compilation errors.
    """
    print("--- Verifying Proof ---")
    print("Code:")
    print(lean_code)
    print("-" * 25)
    
    command = Command(cmd=lean_code)
    result = server.run(command)
    
    error_messages = [msg.data for msg in result.messages if msg.severity == 'error']

    if not error_messages:
        print("Proof compiled successfully with no errors.")
    else:
        print("Proof failed to compile. Error(s):")
        print("\n".join(error_messages))


def get_proof_state_at_line(server, theorem_code: str, target_line_number: int):
    """
    Executes a proof up to a specific line in a single, fast command
    and returns the goal state at that point. 
    """
    print(f"--- Inspecting State at Line {target_line_number} ---")
    
    lines = theorem_code.strip().split('\n')

    try:
        by_line_index = next(i for i, line in enumerate(lines) if "by" in line)
    except StopIteration:
        print("Error: Could not find 'by' keyword to start the proof.")
        return

    if target_line_number <= by_line_index + 1:
        # If the target is before or at the 'by' line, get the initial state
        theorem_header = "\n".join(lines[:by_line_index + 1])
        command_str = f"{theorem_header} sorry"
    else:
        # Construct a partial proof that stops at the target line
        target_line_index_in_file = target_line_number - 1
        partial_proof_lines = lines[:target_line_index_in_file + 1]
        command_str = "\n".join(partial_proof_lines) + "\n  sorry"

    command = Command(cmd=command_str)
    result = server.run(command)
    
    if result.sorries:
        print(f"Success, found proof state:\n")
        print(result.sorries[0].goal)
    else:
        print("Could not retrieve proof state.")


def main():
    # --- Step 1: Install Dependencies ---
    print("--- Ensuring Dependencies are Installed ---")
    os.system("curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y")
    os.environ['PATH'] = f"{os.environ.get('HOME')}/.elan/bin:{os.environ['PATH']}"
    os.system("pip install lean_interact")
    print("Dependencies are ready.")

    # --- Step 2: Configure and Start the Server ---
    print("\n--- Initializing Server with Mathlib (This will be slow for the first time, maybe more times) ---")
    config = LeanREPLConfig(project=TempRequireProject(lean_version="v4.22.0-rc4", require="mathlib"))
    server = AutoLeanServer(config)
    print("Server is running")

    # --- VERIFYING PROOFS ---
    print("\n" + "="*50)
    print("DEMO 1: VERIFYING PROOFS")
    print("="*50)
    
    successful_proof = "theorem simple_success : 1 + 1 = 2 := by rfl"
    verify_proof(server, successful_proof)
    
    print("\n")
    
    failing_proof = "theorem simple_fail : 2 + 2 = 5 := by rfl"
    verify_proof(server, failing_proof)

    # --- INSPECTING PROOF STATE ---
    print("\n" + "="*50)
    print("DEMO 2: INSPECTING PROOF STATE")
    print("="*50)
    
    theorem_1 = """
import Mathlib

theorem lean_workbook_plus_30931 (x : ℝ) (hx: x > 0) : x + 1/x ≥ 2 ∧ (x = 1 ↔ x + 1/x = 2)   :=  by
  refine' ⟨_, ⟨fun h ↦ _, fun h ↦ _⟩⟩
  field_simp [hx]
  any_goals field_simp [hx, h]; ring
  rw [le_div_iff₀ hx]
  linarith [sq_nonneg (x - 1)]
  field_simp [eq_div_iff (ne_of_gt hx), mul_comm] at h ⊢
  nlinarith [sq_nonneg (x - 1)]
"""
    
    get_proof_state_at_line(server, theorem_1, 6)
    
    print("\n")

    get_proof_state_at_line(server, theorem_1, 3)

if __name__ == "__main__":
    main()