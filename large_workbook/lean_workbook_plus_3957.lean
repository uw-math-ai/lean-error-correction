theorem lean_workbook_plus_3957 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : a / b ^ 2 + b / a ^ 2 + 16 / (a + b) ≥ 5 * (1 / a + 1 / b)   := by
  field_simp [ha.ne', hb.ne']
  ring_nf
  field_simp [ha.ne', hb.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (b * a - a ^ 2), sq_nonneg (b * a - b ^ 2)]