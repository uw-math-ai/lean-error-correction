theorem lean_workbook_plus_2995 (a b : ℝ) : 2 * (a ^ 2 - a + 1) * (b ^ 2 - b + 1) - (a + b - 1) ^ 2 - 1 ≥ 0   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a - 1), sq_nonneg (b - 1)]