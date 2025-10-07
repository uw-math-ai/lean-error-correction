theorem lean_workbook_plus_4052 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : a / b + b / c + c / a >= 3 + (c - a) ^ 2 / (b ^ 2 + a * b + b * c + c * a)   := by
  field_simp [ha.ne', hb.ne', hc.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a * c - b * b), sq_nonneg (b * c - a * b)]