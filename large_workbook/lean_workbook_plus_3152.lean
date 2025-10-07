theorem lean_workbook_plus_3152 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) (hxy : x + y = 1) : x / (2 * x + y) + y / (x + 3 * y) ≤ 3 / 5   := by
  field_simp [hx, hy, hxy]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (x - y), sq_nonneg (x - 1 / 3), sq_nonneg (y - 1 / 3)]