theorem lean_workbook_plus_775 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (b + c) / a + (c + a) / b + (a + b) / c ≥ 2 + (4 * (a ^ 2 + b ^ 2 + c ^ 2)) / (a * b + b * c + a * c)   := by
  field_simp [ha.ne', hb.ne', hc.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a * b - a * c), sq_nonneg (b * c - b * a), sq_nonneg (c * a - c * b)]