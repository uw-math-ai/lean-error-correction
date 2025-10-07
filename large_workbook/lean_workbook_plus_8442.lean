theorem lean_workbook_plus_8442 (x y : ℝ) : 3 * (x ^ 2 + y ^ 2 + 1 ^ 2 + y * x + x + y) ≥ 0   := by
  nlinarith [sq_nonneg (x + y), sq_nonneg (x + 1), sq_nonneg (y + 1)]