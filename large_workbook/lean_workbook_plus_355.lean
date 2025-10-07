theorem lean_workbook_plus_355 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (a + b + c) * (1 / a + 1 / b + 1 / c) ≥ 9   := by
  field_simp [ha.ne', hb.ne', hc.ne']
  rw [le_div_iff (by positivity)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]