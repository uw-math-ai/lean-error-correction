# tests/test_core.py
# Run with: pytest tests/test_core.py -v -s

import pytest
from lean_interact.interface import CommandResponse
from lean_verifier.data_models import LeanFile, ProofPair
from lean_verifier.core import (
    verify_lean_code,
    verify_lean_file,
    annotate_proof_worker,
    get_states_at_position,
    get_state_before_first_error,
)

# =============================================================================
# Helpers & Fixtures
# =============================================================================

def assert_goal_contains(actual_state: str, expected_snippets: list[str]):
    """Helper to assert that specific snippets exist within a normalized proof state."""
    assert actual_state is not None, "State was None (expected a goal string)"
    normalized_state = " ".join(actual_state.split())
    for snippet in expected_snippets:
        assert snippet in normalized_state, (
            f"Expected snippet not found: {snippet!r}\nIn state: {normalized_state!r}"
        )

@pytest.fixture
def algebra_proof_code():
    """A complex, multi-line algebra proof used for state retrieval tests."""
    return (
        "theorem algebra_611312 {s : Set ℝ} (hs : s = {x : ℝ | x ^ 4 - 4 * x ^ 3 - 4 * x ^ 2 + 16 * x - 8 = 0}) :\n"
        "    ∑ᶠ x ∈ s, |x| = 2 + 2 * √2 + 2 * √3 := by\n"
        "  -- Suffices to show solution of $x^{4}-4 x^{3}-4 x^{2}+16 x-8=0$ are\n"
        "  -- $1 + √2 + √3, 1 + √2 - √3, 1 - √2 + √3, 1 - √2 - √3$.\n"
        "  suffices s = {1 + √2 + √3, 1 + √2 - √3, 1 - √2 + √3, 1 - √2 - √3} by\n"
        "    -- Transform `Set` to `Finset`.\n"
        "    have : s = ({1 + √2 + √3, 1 + √2 - √3, 1 - √2 + √3, 1 - √2 - √3} : Finset ℝ) := by simp [this]\n"
        "    -- Transform `finsum` to `Finset.sum`.\n"
        "    rw [this, finsum_mem_coe_finset]\n"
        "    -- Expand `Finset.sum`.\n"
        "    repeat rw [Finset.sum_insert]\n"
        "    -- Need `0 < 1 + √2 - √3` to remove `abs`.\n"
        "    have : 0 < 1 + √2 - √3 := by\n"
        "      suffices √3 < 1 + √2 by linarith\n"
        "      rw [← pow_lt_pow_iff_left₀ (n := 2) (by positivity) (by positivity) (by norm_num),\n"
        "        Real.sq_sqrt (by norm_num), add_sq, Real.sq_sqrt (by norm_num)]\n"
        "      suffices 0 < 2 * √2 by linarith\n"
        "      positivity\n"
        "    -- Need `0 < 1 - √2 + √3` to remove `abs`.\n"
        "    have : 0 < 1 - √2 + √3 := by\n"
        "      suffices √2 < 1 + √3 by linarith\n"
        "      rw [← pow_lt_pow_iff_left₀ (n := 2) (by positivity) (by positivity) (by norm_num),\n"
        "        Real.sq_sqrt (by norm_num), add_sq, Real.sq_sqrt (by norm_num)]\n"
        "      suffices -2 < 2 * √3 by linarith\n"
        "      exact lt_trans (by norm_num : -2 < (0 : ℝ)) (by positivity)\n"
        "    -- Need `1 - √2 - √3 < 0` to remove `abs`.\n"
        "    have : 1 - √2 - √3 < 0 := by\n"
        "      suffices 1 < √2 + √3 by linarith\n"
        "      trans √2\n"
        "      . rw [← pow_lt_pow_iff_left₀ (n := 2) (by positivity) (by positivity) (by norm_num),\n"
        "          Real.sq_sqrt (by norm_num)]\n"
        "        norm_num\n"
        "      . simp\n"
        "    -- Remove all `abs`.\n"
        "    rw [Finset.sum_singleton, abs_of_pos (by positivity), abs_of_pos ‹_›, abs_of_pos ‹_›,\n"
        "      abs_of_neg ‹_›]\n"
        "    -- `ring` can solve this identity.\n"
        "    ring\n"
        "    . -- Show `1 - √2 + √3 ∉ {1 - √2 - √3}`.\n"
        "      intro h\n"
        "      rw [Finset.mem_singleton] at h\n"
        "      have : 2 * √3 = 0 := by linear_combination h\n"
        "      simp at this\n"
        "    . -- Show ` 1 + √2 - √3 ∉ {1 - √2 + √3, 1 - √2 - √3}`.\n"
        "      intro h\n"
        "      rw [Finset.mem_insert, Finset.mem_singleton] at h\n"
        "      rcases h with h | h\n"
        "      . have : 2 * √2 = 2 * √3 := by linear_combination h\n"
        "        simp at this\n"
        "      . have : 2 * √2 = 0 := by linear_combination h\n"
        "        simp at this\n"
        "    . -- Show `1 + √2 + √3 ∉ {1 + √2 - √3, 1 - √2 + √3, 1 - √2 - √3}`.\n"
        "      intro h\n"
        "      simp at h\n"
        "      rcases h with h | h | h\n"
        "      . have : 2 * √3 = 0 := by linear_combination h\n"
        "        simp at this\n"
        "      . have : 2 * √2 = 0 := by linear_combination h\n"
        "        simp at this\n"
        "      . have : 2 * (√2 + √3) = 0 := by linear_combination h\n"
        "        linarith [show 0 < 2 * (√2 + √3) by positivity]\n"
        "  ext x\n"
        "  -- It's clear that `x ∈ {a, b, c, d}` if and only if `(x - a) * (x - b) * (x - c) * (x - d) = 0`.\n"
        "  have {a b c d : ℝ} (x : ℝ) : x ∈ ({a, b, c, d} : Set ℝ) ↔\n"
        "      (x - a) * (x - b) * (x - c) * (x - d) = 0 := by\n"
        "    simp [sub_eq_zero]; tauto\n"
        "  rw [this, hs, Set.mem_setOf]\n"
        "  apply Eq.congr_left\n"
        "  -- We can show `x ^ 4 - 4 * x ^ 3 - 4 * x ^ 2 + 16 * x - 8` equals to\n"
        "  -- `(x - (1 + √2 + √3)) * (x - (1 + √2 - √3)) * (x - (1 - √2 + √3)) * (x - (1 - √2 - √3))`\n"
        "  -- by simple calculation.\n"
        "  calc\n"
        "    _ = (x ^ 2 - 2 * x) ^ 2 - 8 * (x - 1) ^ 2 := by ring\n"
        "    _ = (x ^ 2 - 2 * x) ^ 2 - (2 * √2 * x - 2 * √2) ^ 2 := by\n"
        "      congr 1; ring_nf; rw [Real.sq_sqrt (by norm_num)]; ring\n"
        "    _ = (x ^ 2 - (2 + 2 * √2) * x + 2 * √2) * (x ^ 2 - (2 - 2 * √2) * x - 2 * √2) := by\n"
        "      rw [sq_sub_sq, mul_comm]; congr 1 <;> ring\n"
        "  rw [mul_assoc]\n"
        "  congr 1\n"
        "  all_goals\n"
        "    ring_nf\n"
        "    repeat rw [Real.sq_sqrt (by norm_num)]\n"
        "    ring\n"
    )

# =============================================================================
# Test Group 1: Basic Verification (String Input)
# =============================================================================

class TestBasicVerification:
    @pytest.mark.parametrize(
        "test_id, lean_code, expected_status, expect_errors",
        [
            ("pass_simple_rfl", "theorem simple_pass : 1 + 1 = 2 := rfl", "pass", False),
            ("fail_simple_rfl", "theorem simple_fail : 1 + 1 = 3 := rfl", "fail", True),
            ("fail_syntax_error", "theorem syntax_error := rfl", "fail", True),
        ],
    )
    def test_verify_lean_code(self, lean_server, test_id, lean_code, expected_status, expect_errors):
        """Tests the raw verify_lean_code function with string input."""
        print(f"\nRunning test: {test_id}")
        status, result = verify_lean_code(lean_code, lean_server)
        
        assert status == expected_status
        assert isinstance(result, CommandResponse)
        assert result.has_errors() == expect_errors
        
        if status == "fail" and result.has_errors():
            print(f"  > Confirmed error: {str(result.get_errors()[0].data)[:50]}...")

    def test_algebra_proof_compiles(self, lean_server, algebra_proof_code):
        """Ensures the large fixture proof is actually valid before we probe it."""
        status, result = verify_lean_code(algebra_proof_code, lean_server)
        assert status == "pass"
        assert not result.has_errors()


# =============================================================================
# Test Group 2: Worker Functions (File & Annotation)
# =============================================================================

class TestWorkerFunctions:
    
    def test_verify_lean_file_pass(self, lean_config):
        """Test verify_lean_file with valid code (simulating file read)."""
        lean_file = LeanFile(
            "test_pass.lean", 
            "theorem simple_pass : 1 + 1 = 2 := rfl", 
            "dummy_hash"
        )
        status, output_data = verify_lean_file(lean_config, lean_file)
        
        assert status == 'pass'
        assert output_data['path'] == 'test_pass.lean'
        assert 'errors' not in output_data

    def test_verify_lean_file_fail(self, lean_config):
        """Test verify_lean_file with invalid tactic (checks error capture)."""
        lean_file = LeanFile(
            "test_fail.lean", 
            "theorem simple_fail : 1 + 1 = 3 := rfl", 
            "dummy_hash"
        )
        status, output_data = verify_lean_file(lean_config, lean_file)
        
        assert status == 'fail'
        assert output_data['path'] == 'test_fail.lean'
        assert len(output_data['errors']) > 0
        assert "not definitionally equal" in output_data['errors'][0]

    def test_annotate_worker_tactic_error(self, lean_config):
        """Test annotate_proof_worker with a Tactic Error (Success Case)."""
        pair = ProofPair(
            path="test_tactic_fail.lean",
            correct_proof="",
            incorrect_proof="theorem simple_fail : 1 + 1 = 3 := by\n  rfl" # Error on line 2
        )
        status, data = annotate_proof_worker(lean_config, pair)

        assert status == 'annotated'
        assert "tactic 'rfl' failed" in data['error']
        assert data['line'] == 2
        assert data['line_at_error'] == "rfl"
        assert "⊢ 1 + 1 = 3" in data['state_at_error']

    def test_annotate_worker_syntax_error(self, lean_config):
        """Test annotate_proof_worker with a Syntax Error (No State)."""
        pair = ProofPair(
            path="test_syntax_fail.lean",
            correct_proof="",
            incorrect_proof="theorem syntax_error : 1 + 1 = 2\nby\n  rfl" # Missing := on line 1
        )
        status, data = annotate_proof_worker(lean_config, pair)
        
        assert status == 'annotated'
        assert "expected ':='" in data['error']
        assert data['line'] == 1
        assert data['state_at_error'] == "Could not retrieve proof state."

    def test_annotate_worker_no_error(self, lean_config):
        """Test annotate_proof_worker with correct code (Skip Case)."""
        pair = ProofPair(
            path="test_correct.lean",
            correct_proof="",
            incorrect_proof="theorem simple_pass : 1 + 1 = 2 := rfl"
        )
        status, data = annotate_proof_worker(lean_config, pair)
        
        assert status == 'skipped'
        assert data['reason'] == "no errors found"


# =============================================================================
# Test Group 3: Precision State Retrieval
# =============================================================================

class TestStateRetrieval:
    
    def test_state_at_start_of_tactic(self, lean_server, algebra_proof_code):
        """Probe Line 5 (start): Expect the main ∑ᶠ goal."""
        states = get_states_at_position(algebra_proof_code, lean_server, line=5, col=3)
        candidate = states["state_before"] or states["state_after"]
        
        assert_goal_contains(candidate, [
            "s : Set ℝ",
            "hs : s = {x | x ^ 4 - 4 * x ^ 3 - 4 * x ^ 2 + 16 * x - 8 = 0}",
            "⊢ ∑ᶠ (x : ℝ) (_ : x ∈ s), |x| = 2 + 2 * √2 + 2 * √3",
        ])

    def test_state_at_end_of_line(self, lean_server, algebra_proof_code):
        """Probe Line 5 (end): Expect same ∑ᶠ goal (cursor at EOL)."""
        states = get_states_at_position(algebra_proof_code, lean_server, line=5, col=10_000)
        candidate = states["state_before"] or states["state_after"]
        
        assert_goal_contains(candidate, [
            "⊢ ∑ᶠ (x : ℝ) (_ : x ∈ s), |x| = 2 + 2 * √2 + 2 * √3",
        ])

    def test_state_at_have_definition(self, lean_server, algebra_proof_code):
        """
        Probe Line 7 (start of 'have'): Expect the 'have' subgoal OR the main goal.
        This ensures we handle 'have' tactics which introduce new local contexts.
        """
        # Row 7, beginning of the 'have : s = (...) := by simp [this]' line.
        states = get_states_at_position(algebra_proof_code, lean_server, line=7, col=3)
        candidate = states["state_before"] or states["state_after"]
        
        # We accept either the new subgoal (s = ...) or the outer goal (∑ᶠ ...)
        # depending on exactly how the InfoTree spans the 'have' keyword.
        assert candidate is not None
        flat = " ".join(candidate.split())
        ok = (
            "⊢ s = {1 + √2 + √3, 1 + √2 - √3, 1 - √2 + √3, 1 - √2 - √3}" in flat
            or "⊢ ∑ᶠ (x : ℝ) (_ : x ∈ s), |x| = 2 + 2 * √2 + 2 * √3" in flat
        )
        assert ok, f"Unexpected state at have-begin:\n{candidate}"

    def test_state_after_have_tactic_no_goals(self, lean_server, algebra_proof_code):
        """
        Probe Line 7 (end): Expect 'no goals' or the main goal.
        This tests the edge case where a line finishes a tactic completely.
        """
        # Row 7, very large column.
        states = get_states_at_position(algebra_proof_code, lean_server, line=7, col=10_000)
        before, after = states["state_before"], states["state_after"]
        
        # It is valid for Lean to report "no goals" here if the cursor is past the proof step.
        # It is also valid to see the main outer goal if the span is wide.
        is_no_goals = (before == "no goals") or (after == "no goals")
        is_main_goal = (before and "⊢ ∑ᶠ (x : ℝ)" in before) or (after and "⊢ ∑ᶠ (x : ℝ)" in after)
        
        assert is_no_goals or is_main_goal, (
            f"Expected 'no goals' or ∑ᶠ goal near end; got before={before} after={after}"
        )

    def test_state_at_mid_line_before_tactic(self, lean_server, algebra_proof_code):
        """Probe Line 77 (mid-line): Before 'congr 1'. Expect single goal."""
        # Col 30 is closing bracket ']' of 'rw', right before 'congr'.
        states = get_states_at_position(algebra_proof_code, lean_server, line=77, col=30)
        candidate = states["state_before"] or states["state_after"]
        
        assert_goal_contains(candidate, [
            "x : ℝ",
            "⊢ (x ^ 2 - 2 * x - (2 * √2 * x - 2 * √2)) * (x ^ 2 - 2 * x + (2 * √2 * x - 2 * √2)) =",
            "(x ^ 2 - (2 + 2 * √2) * x + 2 * √2) * (x ^ 2 - (2 - 2 * √2) * x - 2 * √2)"
        ])

    def test_state_at_mid_line_after_tactic(self, lean_server, algebra_proof_code):
        """Probe Line 77 (mid-line): After 'congr 1'. Expect split subgoals."""
        # Col 40 is after 'congr 1'.
        states = get_states_at_position(algebra_proof_code, lean_server, line=77, col=40)
        candidate = states["state_after"] or states["state_before"] 
        
        assert_goal_contains(candidate, [
            "case e_a",
            "⊢ x ^ 2 - 2 * x - (2 * √2 * x - 2 * √2) = x ^ 2 - (2 + 2 * √2) * x + 2 * √2",
            "⊢ x ^ 2 - 2 * x + (2 * √2 * x - 2 * √2) = x ^ 2 - (2 - 2 * √2) * x - 2 * √2"
        ])

    def test_complex_error_recovery(self, lean_server):
        """
        Tests handling of a messy file with multiple errors.
        Ensures we catch the FIRST error and its corresponding state.
        """
        lean_code = (
            "theorem number_theory_4725 : ∃ (a b c : ℤ), a ∣ b * c ∧ ¬ a ∣ b ∧ ¬ a ∣ c := by\n"
            "  use 6; use 2; use 3\n"
            "  constructor\n"
            "  · rfl\n"
            "  · constructor\n"
            "    · apply (Int.exists_lt_and_lt_iff_not_dvd 2 (show 0 < by linarith)).mp\n"
            "      use 0; aesop\n"
            "    · apply (Int.exists_lt_and_lt_iff_not_dvd 3 (show 0 < (6 : ℤ) by linarith)).mp\n"
            "      use 0; \n" 
        )

        # 1. Check basic error detection
        status, payload = verify_lean_code(lean_code, lean_server)
        assert status == "fail"
        assert len(payload.get_errors()) >= 1

        # 2. Check specific state retrieval
        info = get_state_before_first_error(lean_code, lean_server)
        state = info.get("state_before") or info.get("state_after")
        
        assert state is not None
        
        # This state corresponds to the goals remaining just before the last line fails
        assert_goal_contains(state, [
             "⊢ ¬6 ∣ 2 ∧ ¬6 ∣ 3", 
             "case h.right" 
        ])