theorem lean_workbook_plus_6000 (x : ℝ) : x ^ 8 - x ^ 5 + x ^ 2 - x + 1 > 0   := by
  nlinarith [sq_nonneg (x ^ 2 - x), sq_nonneg (x ^ 2 - 1), sq_nonneg (x ^ 4 - x)]