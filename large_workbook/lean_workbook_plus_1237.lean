theorem lean_workbook_plus_1237 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a + b ≤ 1) : 1 / a + 1 / b + a ^ 2 + b ^ 2 + 3 * a + 3 * b ≥ 15 / 2   := by
  field_simp [ha.ne', hb.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [mul_nonneg ha.le hb.le, sq_nonneg (a * b), sq_nonneg (a - b), sq_nonneg (a + b - 1)]