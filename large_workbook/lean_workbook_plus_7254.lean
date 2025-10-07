theorem lean_workbook_plus_7254 (a : ℝ) (h : a > 0) : a^3 + 11 > 9*a   := by
  nlinarith [sq_nonneg (a^2 - 3), sq_nonneg (a^2 - 4)]