theorem lean_workbook_plus_4073 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a ≥ 2 * b) : a^2 / b + b^2 / a ≥ 9 * a / 4   := by
  field_simp [ha.ne', hb.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a - 2 * b), sq_nonneg (a - b)]