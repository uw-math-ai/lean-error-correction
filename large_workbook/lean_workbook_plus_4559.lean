theorem lean_workbook_plus_4559 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) (h : x^3 + y^3 = x - y) : x^2 + y^2 < 1   := by
  nlinarith [sq_nonneg (x - 1), sq_nonneg (y - 1), hx, hy, h]