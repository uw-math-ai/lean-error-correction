theorem lean_workbook_plus_4033 (x y : ℝ) (hxy : x > y) (hy : y > 0) : x^4 + 3*y^4 > 4*x*y^3   := by
  have h1 : x^2 > y^2 := by nlinarith
  nlinarith [sq_nonneg (x - y), sq_nonneg (x + y)]