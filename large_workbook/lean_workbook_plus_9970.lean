theorem lean_workbook_plus_9970 (x y : ℝ) : 5 * x ^ 2 + y ^ 2 + 4 ≥ 4 * x + 4 * x * y   := by
  nlinarith [sq_nonneg (x - 2), sq_nonneg (2 * x - y)]