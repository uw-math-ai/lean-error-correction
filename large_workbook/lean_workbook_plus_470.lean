theorem lean_workbook_plus_470 (a d : ℝ) (h : a = 0 ∧ d = 0) : ∑' i : ℕ, (a + i * d) = 0   := by
  simp [h.1, h.2, tsum_zero]