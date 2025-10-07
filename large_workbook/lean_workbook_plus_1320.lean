theorem lean_workbook_plus_1320 (a b c d : ℝ) : 2 * (a + c) ^ 2 + 2 * (b + d) ^ 2 ≥ 8 * (a * c + b * d)   := by
  linarith [sq_nonneg (a - c), sq_nonneg (b - d)]