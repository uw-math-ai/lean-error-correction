theorem lean_workbook_plus_8223 (x y z : ℝ) :
  x ^ 2 / (x ^ 2 * y) ^ (1 / 3) + y ^ 2 / (y ^ 2 * z) ^ (1 / 3) + z ^ 2 / (z ^ 2 * x) ^ (1 / 3) ≥
    (x ^ 2 + y ^ 2 + z ^ 2) / (x ^ 2 * y + y ^ 2 * z + z ^ 2 * x) ^ (1 / 3)   := by
  norm_num [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]