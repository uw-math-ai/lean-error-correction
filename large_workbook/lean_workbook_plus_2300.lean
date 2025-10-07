theorem lean_workbook_plus_2300 (x y : ℝ) (hx : x = 20 / 100 * 23) (hy : y = 23 / 100 * 20) : x * y = 21.16   := by
  norm_num [hx, hy]