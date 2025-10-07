theorem lean_workbook_plus_1355 (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) : (y / (x * y + y + 1) + z / (y * z + z + 1) + x / (z * x + x + 1)) ≤ 1   := by
  field_simp [add_comm]
  rw [div_le_iff (by positivity)]
  nlinarith [sq_nonneg (x * y * z - 1), sq_nonneg (x * y - y * z), sq_nonneg (y * z - z * x),
  sq_nonneg (z * x - x * y), sq_nonneg (x * y * z - x * y), sq_nonneg (x * y * z - y * z),
  sq_nonneg (x * y * z - z * x), sq_nonneg (x * y * z - 1)]