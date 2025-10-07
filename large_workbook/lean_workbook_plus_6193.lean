theorem lean_workbook_plus_6193 (a b : ℝ): a^2 + a * b + b^2 ≥ 3 * (a + b - 1)   := by
  nlinarith [sq_nonneg (a - 1), sq_nonneg (b - 1)]