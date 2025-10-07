theorem lean_workbook_plus_4137 (x : ℝ) : x^4 + 1 ≥ 2 * x^2   := by
  nlinarith [sq_nonneg (x^2 - 1), sq_nonneg (x^2 + 1)]