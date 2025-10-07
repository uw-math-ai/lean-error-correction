theorem lean_workbook_plus_7582 (x y : ℝ) : (x - y) ^ 2 * (4 * x ^ 2 + 7 * x * y + 4 * y ^ 2) ≥ 0   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (x + y)]