theorem lean_workbook_plus_5616 (x y z : ℝ) (hx : x > 0) (hy : y > 0) (hz : z > 0) : (1 / (x * y * z)) ≥ 9 / ((x * y + y * z + x * z) * (x + y + z))   := by
  rw [ge_iff_le, div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]