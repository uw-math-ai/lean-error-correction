theorem lean_workbook_plus_4857 (a b c : ℝ) (ha : a + b + c = 3) : a * b + b * c + c * a <= 3   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]