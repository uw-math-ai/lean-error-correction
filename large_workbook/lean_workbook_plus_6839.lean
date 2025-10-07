theorem lean_workbook_plus_6839 (x : ℝ) : x^2 + 6*x - 16 = 0 ↔ x = -8 ∨ x = 2   := by
  refine' ⟨fun h => _, fun h => _⟩
  have h1 : (x + 8) * (x - 2) = 0 := by linarith
  simp [sub_eq_zero, add_eq_zero_iff_eq_neg] at h1
  exacts [h1, by cases' h with h h <;> rw [h] <;> norm_num]