theorem lean_workbook_plus_3087 (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) : x ^ 4 * z ^ 2 + y ^ 4 * x ^ 2 + z ^ 4 * y ^ 2 ≥ x * y * z * (x ^ 2 * z + y ^ 2 * x + z ^ 2 * y)   := by
  have h1 := sq_nonneg (x^2 * z - y * x * z)
  have h2 := sq_nonneg (y^2 * x - z^2 * y)
  have h3 := sq_nonneg (z^2 * y - x^2 * z)
  nlinarith [sq_nonneg (x * y * z - x^2 * z), sq_nonneg (x * y * z - y^2 * x), sq_nonneg (x * y * z - z^2 * y)]