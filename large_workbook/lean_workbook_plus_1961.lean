theorem lean_workbook_plus_1961 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (a^2 / (a + b) + b^2 / (b + c)) ≥ (3 * a + 2 * b - c) / 4   := by
  field_simp [ha.ne', hb.ne', hc.ne']
  rw [div_le_div_iff] <;> nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]