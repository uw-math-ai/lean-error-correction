theorem lean_workbook_plus_6811 (x y z : ℝ) :
  x^2 * y^2 - x^2 * y * z + x^2 * z^2 - x * y^2 * z - x * y * z^2 + y^2 * z^2 ≥ 0   := by
  nlinarith [sq_nonneg (x * y - x * z), sq_nonneg (x * y - y * z), sq_nonneg (x * z - y * z)]