theorem lean_workbook_plus_1476 (x y z: ℝ) : (x + y + z) ^ 2 ≤ 3 * (x ^ 2 + y ^ 2 + z ^ 2)   := by
  linarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]