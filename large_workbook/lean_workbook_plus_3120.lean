theorem lean_workbook_plus_3120 (a b c : ℝ) : 3 * (b * c + c * a + a * b) ≤ (a + b + c) ^ 2   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]