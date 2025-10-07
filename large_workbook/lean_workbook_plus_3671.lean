theorem lean_workbook_plus_3671 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) (h : x + y = x^2 * y^3) : 3 / x + 5 / y ≥ 4 * (8:ℝ) ^ (1 / 4)   := by
  norm_num [hx, hy, h]
  field_simp [hx, hy]
  rw [le_div_iff (mul_pos hx hy)]
  nlinarith [sq_nonneg (x * y - 1), sq_nonneg (x * y - 2)]