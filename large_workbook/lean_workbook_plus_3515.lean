theorem lean_workbook_plus_3515 (x y z : ℝ) : (x + y - z) ^ 2 + (y + z - x) ^ 2 + (z + x - y) ^ 2 ≥ x ^ 2 + y ^ 2 + z ^ 2   := by
  linarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]