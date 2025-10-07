theorem lean_workbook_plus_3423 (a b : ℝ) (hab : a > 0 ∧ b > 0) (h : a^3 + b^3 = a - b) : a^2 + b^2 < 1   := by
  nlinarith [sq_nonneg (a - 1), sq_nonneg (b - 1)]