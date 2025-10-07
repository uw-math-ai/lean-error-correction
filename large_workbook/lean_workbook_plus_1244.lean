theorem lean_workbook_plus_1244 (x y z : ℝ) : x ^ 2 + y ^ 2 + z ^ 2 ≥ (x + y + z) ^ 2 / 3   := by
  linarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]