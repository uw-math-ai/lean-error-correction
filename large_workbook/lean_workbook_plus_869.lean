theorem lean_workbook_plus_869 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : a / (a + 1) + b / (b + 1) ≥ (a + b) / (a + b + 1)   := by
  field_simp [ha.ne', hb.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [mul_nonneg ha.le hb.le, mul_nonneg hb.le ha.le]