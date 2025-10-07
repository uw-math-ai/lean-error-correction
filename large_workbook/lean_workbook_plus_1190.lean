theorem lean_workbook_plus_1190 (a b : ℝ) : a ^ 2 + b ^ 2 ≥ 2 * a * b   := by
  nlinarith [sq_nonneg (a - b)]