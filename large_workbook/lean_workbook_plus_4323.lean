theorem lean_workbook_plus_4323 (a b : ℝ) : 4 * b ^ 2 * (a ^ 2 + b ^ 2 - 2 * a * b) ≥ 0   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a + b)]