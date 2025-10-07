theorem lean_workbook_plus_3917 (x y z : ℝ) : x ^ 2 + y ^ 2 + z ^ 2 ≥ x * y + y * z + z * x   := by
  linarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]