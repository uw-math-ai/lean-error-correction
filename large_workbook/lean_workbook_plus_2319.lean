theorem lean_workbook_plus_2319 (x y : ℝ) (hx : 1 < x) (hy : 1 < y) : (x^2 / (y - 1) + y^2 / (x - 1)) ≥ 8   := by
  have h1 : 0 < x - 1 := by linarith
  rw [ge_iff_le]
  have h2 : 0 < y - 1 := by linarith
  have h3 := sq_nonneg (x - 2)
  have h4 : 0 ≤ (y - 2) ^ 2 := sq_nonneg (y - 2)
  have h5 := sq_nonneg (x - y)
  have h6 := sq_nonneg (x - y - 1)
  have h7 : 0 ≤ (x - 1) * (y - 1) := mul_nonneg (sub_nonneg.mpr hx.le) (sub_nonneg.mpr hy.le)
  field_simp [h1, h2]
  rw [le_div_iff (by positivity)]
  nlinarith [sq_nonneg (x - 2), sq_nonneg (y - 2), sq_nonneg (x - y), sq_nonneg (x - y - 1)]