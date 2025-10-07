theorem lean_workbook_plus_1031 (x : ℝ) (hx : x > 0) : x + 1 / x ≥ 2   := by
  field_simp [hx]
  rw [le_div_iff (by positivity)]
  nlinarith [sq_nonneg (x - 1)]