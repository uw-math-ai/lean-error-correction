theorem lean_workbook_plus_8407 (a b : ℝ) : a ^ 2 + b ^ 2 ≥ a * b   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a + b)]