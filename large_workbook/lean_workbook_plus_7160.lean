theorem lean_workbook_plus_7160 (x y z : ℝ) (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) (habc : x*y*z = 1) : (1+x)*(1+y)*(1+z) ≥ 2*(1 + (x / z)^(1/3) + (y / x)^(1/3) + (z / y)^(1/3))   := by
  norm_num [hx, hy, hz, habc]
  nlinarith [sq_nonneg (x * y - 1), sq_nonneg (y * z - 1), sq_nonneg (z * x - 1)]