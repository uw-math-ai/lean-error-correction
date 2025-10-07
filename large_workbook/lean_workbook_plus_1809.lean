theorem lean_workbook_plus_1809 (a b c : ℝ) (h : a + b + c ≥ 3 * a * b * c) : a ^ 2 + b ^ 2 + c ^ 2 ≥ 2 * a * b * c   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]