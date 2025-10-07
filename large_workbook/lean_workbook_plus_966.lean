theorem lean_workbook_plus_966 (a b : ℝ) : (3 / 4) * (a + b) ^ 2 ≥ 3 * a * b   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a + b)]