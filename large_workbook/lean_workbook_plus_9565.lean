theorem lean_workbook_plus_9565 (x : ℝ) : x^4 - x^2 - 2*x + 2 ≥ 0   := by
  nlinarith [sq_nonneg (x ^ 2 - 1), sq_nonneg (x ^ 2 + x - 1)]