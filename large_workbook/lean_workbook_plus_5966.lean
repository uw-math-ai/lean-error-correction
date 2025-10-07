theorem lean_workbook_plus_5966 (s : ℝ) (hs : s > 0) : (s^3 + 2) / (3 * s) ≥ 1   := by
  field_simp [hs]
  rw [le_div_iff (by positivity)]
  nlinarith [sq_nonneg (s - 1), sq_nonneg (s - 2)]