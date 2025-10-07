theorem lean_workbook_plus_9482 (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) : (y + z) * (z + x) * (x + y) / (4 * x * y * z) ≥ 1 + (x ^ 2 + y ^ 2 + z ^ 2) / (x * y + y * z + z * x)   := by
  field_simp [hx, hy, hz]
  exact (div_le_div_iff (by positivity) (by positivity)).mpr <| by nlinarith [sq_nonneg (x * y - y * z), sq_nonneg (y * z - z * x), sq_nonneg (z * x - x * y)]