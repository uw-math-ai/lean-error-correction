theorem lean_workbook_plus_4240 (x y z : ℝ) (hx : x > 0) (hy : y > 0) (hz : z > 0) (habc : x * y * z = 1) : x^2 / (x^2 + x + 1) + y^2 / (y^2 + y + 1) + z^2 / (z^2 + z + 1) ≥ 1   := by
  field_simp [add_comm, add_left_comm, add_assoc]
  rw [le_div_iff (by positivity)]
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]