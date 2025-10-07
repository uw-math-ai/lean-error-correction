theorem lean_workbook_plus_8594 (k : ℝ) : k^2 + 3*k - 108 = 0 ↔ k = 9 ∨ k = -12   := by
  have h1 : k ^ 2 + 3 * k - 108 = (k - 9) * (k + 12) := by ring
  simp [h1, sub_eq_zero, add_eq_zero_iff_eq_neg]