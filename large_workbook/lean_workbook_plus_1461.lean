theorem lean_workbook_plus_1461 (x y z : ℝ) : x^4 + y^4 + z^4 + x*y^3 + y*z^3 + z*x^3 ≥ 2*(x*y^3 + y*z^3 + z*x^3)   := by
  have h1 : 0 ≤ (x - y)^2 + (y - z)^2 + (z - x)^2 := by nlinarith
  nlinarith [sq_nonneg (x^2 - y^2), sq_nonneg (y^2 - z^2), sq_nonneg (z^2 - x^2)]