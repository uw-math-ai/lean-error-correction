theorem lean_workbook_plus_2745 (x y z : ℝ) : x^6 + y^6 + z^6 ≥ x^4*y*z + y^4*z*x + z^4*x*y   := by
  have h1 := sq_nonneg (x^2 - y^2)
  have h2 := sq_nonneg (y^2 - z^2)
  have h3 := sq_nonneg (z^2 - x^2)
  have h4 := sq_nonneg (x^2 - y^2 + y^2 - z^2 + z^2 - x^2)
  nlinarith [sq_nonneg (x ^ 2 - y * z), sq_nonneg (y ^ 2 - z * x), sq_nonneg (z ^ 2 - x * y)]