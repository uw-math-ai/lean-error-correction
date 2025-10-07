theorem lean_workbook_plus_8941 (a b : ℝ) (ha : 1 < a) (hb : 1 < b) : a^2 / (b - 1) + b^2 / (a - 1) ≥ 8   := by
  field_simp [ha.ne', hb.ne']
  have h1 : 0 < a - 1 := by linarith
  have h2 : 0 < b - 1 := by linarith
  field_simp [h1, h2]
  rw [le_div_iff (by positivity)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (a - 2), sq_nonneg (b - 2)]