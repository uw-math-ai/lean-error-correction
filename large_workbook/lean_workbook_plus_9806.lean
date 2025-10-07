theorem lean_workbook_plus_9806 (x : ℝ) : 3 * x ^ 2 - 5 * x - 2 = 0 ↔ x = 2 ∨ x = -1/3   := by
  refine' ⟨fun h => _, fun h => _⟩
  have h1 : (x - 2) * (3 * x + 1) = 0 := by linarith
  cases' eq_zero_or_eq_zero_of_mul_eq_zero h1 with h2 h2
  exacts [Or.inl (by linarith), Or.inr (by linarith), by cases' h with h h <;> rw [h] <;> norm_num]