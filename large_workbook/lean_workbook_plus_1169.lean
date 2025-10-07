theorem lean_workbook_plus_1169 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (4 / 3) * (a / (b + c) + b / (c + a) + c / (a + b)) + (abc / (a + b) / (b + c) / (c + a))^(1 / 3) ≥ 5 / 2   := by
  norm_num [ha, hb, hc]
  field_simp [ha.ne', hb.ne', hc.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a + b - c), sq_nonneg (b + c - a), sq_nonneg (c + a - b)]