theorem lean_workbook_plus_5289 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : 2 + (a^2 + b^2 + c^2) / (a * b + b * c + c * a) ≥ (a + b) / (b + c) + (b + c) / (c + a) + (c + a) / (a + b)   := by
  field_simp [ha.ne', hb.ne', hc.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a * b - b * c), sq_nonneg (b * c - c * a), sq_nonneg (c * a - a * b)]