theorem lean_workbook_plus_3563 (x : ℝ) : (x^2 + 2)^2 ≥ 4 * (x^2 + 1)   := by
  nlinarith [sq_nonneg (x^2 + 1), sq_nonneg (x^2 - 1)]