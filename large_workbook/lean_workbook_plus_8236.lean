theorem lean_workbook_plus_8236 (x : ℝ) : x ^ 8 + x ^ 2 + 1 ≥ x ^ 5 + x   := by
  nlinarith [sq_nonneg (x^3 - 1), sq_nonneg (x^2 - 1), sq_nonneg (x - 1)]