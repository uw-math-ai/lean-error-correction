theorem lean_workbook_plus_7036 (x y z : ℝ) : 4 * z ^ 2 + (x + y) ^ 2 ≥ 4 * z * (x + y)   := by
  nlinarith [sq_nonneg (x + y - 2 * z)]