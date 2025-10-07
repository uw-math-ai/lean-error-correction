theorem lean_workbook_plus_5741 (a b c : ℝ) : 3 * (a * b + a * c + b * c) ≤ (a + b + c) ^ 2   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]