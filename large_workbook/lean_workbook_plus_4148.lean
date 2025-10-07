theorem lean_workbook_plus_4148 (x y z : ℝ) : x ^ 4 + y ^ 4 + z ^ 4 ≥ x ^ 2 * y * z + y ^ 2 * z * x + z ^ 2 * x * y   := by
  have h1 : 0 ≤ (x^2 - y^2)^2 + (y^2 - z^2)^2 + (z^2 - x^2)^2 := by nlinarith
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]