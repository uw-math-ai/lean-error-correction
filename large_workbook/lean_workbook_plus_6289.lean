theorem lean_workbook_plus_6289 (x y z : ℝ) :
  26 * x ^ 2 + 39 * y ^ 2 + 52 * z ^ 2 ≥ 12 * (x + y + z) ^ 2   := by
  linarith [sq_nonneg (26 * x - 12 * x - 12 * y - 12 * z), sq_nonneg (39 * y - 12 * x - 12 * y - 12 * z), sq_nonneg (52 * z - 12 * x - 12 * y - 12 * z)]