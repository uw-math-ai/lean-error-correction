theorem lean_workbook_plus_6168 (a b c d : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hd : 0 < d) : 1 / a + 1 / b + 1 / c + 1 / d > 1 / (a + b + c + d)   := by
  field_simp [ha.ne', hb.ne', hc.ne', hd.ne']
  rw [div_lt_div_iff (by positivity) (by positivity)]
  nlinarith [mul_pos ha hb, mul_pos hc hd, mul_pos ha hc, mul_pos ha hd, mul_pos hb hc, mul_pos hb hd]