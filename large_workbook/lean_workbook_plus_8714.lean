theorem lean_workbook_plus_8714 (x : ℝ) : x^4 - x^3 + x^2 - x + 1 > 0   := by
  nlinarith [sq_nonneg (x^2 - x), sq_nonneg (x^2 - 1)]