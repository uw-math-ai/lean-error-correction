theorem lean_workbook_plus_1215 (a b c d : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hd : 0 < d) : (c + d) * (1 / (a + d) + 1 / (b + c)) ≥ 4 * (c + d) / (a + b + c + d)   := by
  field_simp [ha.ne', hb.ne', hc.ne', hd.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a + b - c - d), sq_nonneg (a - b + c - d), sq_nonneg (a - b - c + d)]