theorem lean_workbook_plus_9972 (x y : ℝ) (h : x ^ 2 + y ^ 2 = 1) : 18 * x * y ≤ 7 + 8 * x ^ 2 * y ^ 2   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (x + y)]