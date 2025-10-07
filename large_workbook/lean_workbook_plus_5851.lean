theorem lean_workbook_plus_5851 (x:ℝ) : (x - 1) ^ 2 * (x ^ 2 + x + 1) ≥ 0   := by
  nlinarith [sq_nonneg (x - 1), sq_nonneg x, sq_nonneg (x + 1)]