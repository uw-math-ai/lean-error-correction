theorem lean_workbook_plus_942 (x y : ℝ) (h : x^2 + y^2 ≤ 2 * x + y) : 2 * x + y ≤ 5   := by
  nlinarith [sq_nonneg (x - 1), sq_nonneg (y - 1)]