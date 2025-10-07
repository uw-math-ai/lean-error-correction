theorem lean_workbook_plus_1120 (a b c k : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hk : 0 ≤ k) : (a + k) / (b + c + 2 * k) + (b + k) / (c + a + 2 * k) + (c + k) / (a + b + 2 * k) ≥ 3 / 2   := by
  field_simp [ha.ne', hb.ne', hc.ne', hk]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]