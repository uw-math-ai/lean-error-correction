theorem lean_workbook_plus_1305 (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) : (x / (y + z) + y / (z + x) + z / (x + y)) ≥ 3 / 2   := by
  field_simp [hx, hy, hz]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]