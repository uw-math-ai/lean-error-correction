theorem lean_workbook_plus_1263 (x y z : ℝ) :
  Real.sqrt ((x ^ 2 + y ^ 2 + z ^ 2) / 3) ≥ (x + y + z) / 3   := by
  apply Real.le_sqrt_of_sq_le
  linarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]