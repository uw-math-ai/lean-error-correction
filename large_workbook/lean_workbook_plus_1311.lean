theorem lean_workbook_plus_1311 (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) : 3 ≤ x / y + y / z + z / x   := by
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y := mul_pos hx hy
  have : 0 < y * z := mul_pos hy hz
  have : 0 < x * z := mul_pos hx hz
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := by positivity
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := mul_pos (mul_pos hx hy) hz
  have : 0 < x * y * z := by positivity
  field_simp [add_comm]
  rw [le_div_iff (by positivity)]
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]