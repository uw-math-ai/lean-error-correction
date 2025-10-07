theorem lean_workbook_plus_5420 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : (a^5 + 2 * b^5) / (a^2 + 2 * b^2) + (a^4 + 2 * b^4) / (a + 2 * b) ≥ 2 / 3 * (a^3 + 2 * b^3)   := by
  have h1 := sq_nonneg (a^2 - b^2)
  have h2 := sq_nonneg (a^2 + b^2 - 2 * a * b)
  field_simp [ha.ne', hb.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (a + b)]