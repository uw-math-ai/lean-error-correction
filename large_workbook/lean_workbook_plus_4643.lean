theorem lean_workbook_plus_4643 (a b : ℝ) (h : a^2 * (a + 1) + b^2 * (b + 1) = 4) : a + b ≤ 2   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a - 1), sq_nonneg (b - 1)]