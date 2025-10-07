theorem lean_workbook_plus_5244 (a b c : ℝ) : (a - b) ^ 2 * (b - c) ^ 2 + 3 * (a * b * c - 1) ^ 2 + 3 - a * b * c ≥ 0   := by
  nlinarith [mul_nonneg (sq_nonneg (a - b)) (sq_nonneg (b - c))]