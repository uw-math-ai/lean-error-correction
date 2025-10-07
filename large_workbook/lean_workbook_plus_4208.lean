theorem lean_workbook_plus_4208 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a + b + 1 = 3 * a * b) : 1 / (a * (b + 1)) + 1 / (b * (a + 1)) ≤ 1   := by
  field_simp [ha.ne', hb.ne']
  rw [div_le_iff (by positivity)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (a - 1), sq_nonneg (b - 1)]