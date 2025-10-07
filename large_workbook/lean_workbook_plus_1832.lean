theorem lean_workbook_plus_1832 (x : ℝ) (hx : x^2 - 18*x + 65 = 0) : (x-13)*(x-5) = 0   := by
  linarith [sq_nonneg (x - 13), sq_nonneg (x - 5)]