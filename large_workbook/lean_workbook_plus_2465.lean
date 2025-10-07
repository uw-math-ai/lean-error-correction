theorem lean_workbook_plus_2465 (x y z : ℝ) : (x + z) ^ 2 - 4 * y * (x + z) + 4 * y ^ 2 ≥ 0   := by
  nlinarith [sq_nonneg (x + z - 2 * y)]