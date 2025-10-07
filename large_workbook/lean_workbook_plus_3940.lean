theorem lean_workbook_plus_3940 (x y z : ℝ) (h : x + y + z = x*y*z) :
  x * (1 - y ^ 2) * (1 - z ^ 2) + y * (1 - z ^ 2) * (1 - x ^ 2) + z * (1 - x ^ 2) * (1 - y ^ 2) = 4*x*y*z   := by
  nlinarith [h, sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]