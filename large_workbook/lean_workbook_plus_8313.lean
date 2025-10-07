theorem lean_workbook_plus_8313 (x y z : ℝ) (hx : x > 0) (hy : y > 0) (hz : z > 0) (habc : x * y * z = 1) : (x ^ 5 * y + y ^ 5 * z + z ^ 5 * x + (x ^ 4 * y * z + y ^ 4 * z * x + z ^ 4 * x * y)) ≤ 3 * (x ^ 6 + y ^ 6 + z ^ 6)   := by
  have h1 := sq_nonneg (x^2 - y*z)
  have h2 := sq_nonneg (y^2 - z * x)
  have h3 := sq_nonneg (z^2 - x * y)
  have h4 := sq_nonneg (x^2 - y^2)
  have h5 := sq_nonneg (y^2 - z^2)
  have h6 := sq_nonneg (z^2 - x^2)
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]