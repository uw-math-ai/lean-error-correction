theorem lean_workbook_plus_9378 (x y : ℝ) (h1 : x ^ 4 + y ^ 4 < 4) (h2 : x ^ 3 + y ^ 3 > 3) : x ^ 2 + y ^ 2 > 2   := by
  nlinarith [sq_nonneg (x - 1), sq_nonneg (y - 1)]