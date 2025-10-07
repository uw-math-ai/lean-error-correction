theorem lean_workbook_plus_7738 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (a / b ^ 2 + b / c ^ 2 + c / a ^ 2) ≥ (1 / a + 1 / b + 1 / c)   := by
  field_simp [ha.ne', hb.ne', hc.ne']
  have h1 : 0 < a * b * c := mul_pos (mul_pos ha hb) hc
  rw [div_le_div_iff (by positivity) (by positivity)]
  have h2 : 0 < a * b * c := mul_pos (mul_pos ha hb) hc
  have h3 : 0 ≤ (a * b - a * c) ^ 2 + (b * c - b * a) ^ 2 + (c * a - c * b) ^ 2 := by positivity
  nlinarith [sq_nonneg (a * b * c * (a * b - a * c)), sq_nonneg (a * b * c * (b * c - b * a)),
  sq_nonneg (a * b * c * (c * a - c * b))]