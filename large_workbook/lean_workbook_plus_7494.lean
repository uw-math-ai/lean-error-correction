theorem lean_workbook_plus_7494 (a b : ℝ) (h : (a + b) * (a + 4 * b) = 9) : a * b ≤ 1   := by
  nlinarith [sq_nonneg (a - 2 * b), sq_nonneg (a + 2 * b)]