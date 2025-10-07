theorem lean_workbook_plus_9293 (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) : (x + 2 * y) / (z + 2 * x + 3 * y) + (y + 2 * z) / (x + 2 * y + 3 * z) + (z + 2 * x) / (y + 2 * z + 3 * x) > 6 / 7   := by
  field_simp [add_comm]
  field_simp [add_comm, add_left_comm, mul_comm, mul_left_comm]
  rw [div_lt_div_iff (by positivity) (by positivity)]
  nlinarith [mul_pos hx hx, mul_pos hx hy, mul_pos hx hz, mul_pos hy hy, mul_pos hy hz, mul_pos hz hz]