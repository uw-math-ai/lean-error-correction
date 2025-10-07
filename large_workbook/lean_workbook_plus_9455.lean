theorem lean_workbook_plus_9455 (a b c : ℝ) : 2 * a * (a + b + c) ≤ 3 * a ^ 2 + b ^ 2 + 2 * a * c   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]