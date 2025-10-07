theorem lean_workbook_plus_1665 (a b c : ℝ) (h : a - b = 4) : a * c + b * c - c ^ 2 - a * b ≤ 4   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a + b - 2 * c)]