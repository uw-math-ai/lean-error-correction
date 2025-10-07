theorem lean_workbook_plus_7050 (a b c : ℝ) (hab : a + b + c ≥ 3) : a ^ 2 + b ^ 2 + c ^ 2 + a * b + a * c + b * c ≥ 6   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]