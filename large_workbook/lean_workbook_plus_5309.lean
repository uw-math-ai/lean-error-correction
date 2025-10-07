theorem lean_workbook_plus_5309 (x y : ℝ) (h : x + y = 10) : x*y ≤ 25   := by
  nlinarith [sq_nonneg (x - 5), sq_nonneg (y - 5)]