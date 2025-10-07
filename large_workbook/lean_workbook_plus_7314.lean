theorem lean_workbook_plus_7314 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) (hxy : x^3 + y^3 = x - y) (h : x^2 + 4*y^2 < 1) : x^2 + 5*y^2 > 4*x*y   := by
  nlinarith [sq_nonneg (x - 2 * y)]