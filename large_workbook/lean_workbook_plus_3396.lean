theorem lean_workbook_plus_3396 (a b: ℝ) : 2 * (a ^ 2 + b ^ 2) ≥ (a - b) ^ 2   := by
  linarith [sq_nonneg (a + b), sq_nonneg (a - b)]