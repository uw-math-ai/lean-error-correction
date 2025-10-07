theorem lean_workbook_plus_4026 (x y z t : ℝ) :
  2 * (x - y) * (y - z) * (z - t) * (t - x) + (x - z) ^ 2 * (y - t) ^ 2 ≥ 0   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - t), sq_nonneg (t - x)]