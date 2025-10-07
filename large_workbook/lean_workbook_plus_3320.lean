theorem lean_workbook_plus_3320 (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) (habc : x * y * z = 1) : (1 + x) * (1 + y) * (1 + z) ≥ 2 * (1 + (y / x)^(1 / 3) + (z / y)^(1 / 3) + (x / z)^(1 / 3))   := by
  simp [add_comm, add_left_comm, mul_comm, mul_left_comm]
  nlinarith [sq_nonneg (x * y - 1), sq_nonneg (y * z - 1), sq_nonneg (z * x - 1)]