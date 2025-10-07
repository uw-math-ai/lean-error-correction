theorem lean_workbook_plus_3937 (x y z : ℝ) (hx: x < y) (hy: y < z) : (x - y) ^ 3 + (y - z) ^ 3 + (z - x) ^ 3 > 0   := by
  nlinarith [mul_pos (sub_pos.mpr hx) (sub_pos.mpr hy)]