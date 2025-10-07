theorem lean_workbook_plus_1663 (x y z : ℝ) : (x + y + z) ^ 2 ≥ 3 * (x*y + y*z + z*x)   := by
  linarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]