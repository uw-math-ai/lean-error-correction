theorem lean_workbook_plus_1188 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) (hxy : 6*x+3*y = 18) : x^(1/3)*y^(2/3) ≤ 4^(2/3)   := by
  norm_num [hx, hy, hxy]