theorem lean_workbook_plus_5946 (x : ℝ) : (x^2 - 6*x + 13/2)^2 >= 0   := by
  nlinarith [sq_nonneg (x ^ 2 - 6 * x + 13 / 2)]