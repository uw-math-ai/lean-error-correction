theorem lean_workbook_plus_5724 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : (a + b + c) / (a * b * c) ≤ 1 / a ^ 2 + 1 / b ^ 2 + 1 / c ^ 2   := by
  have h1 : 0 < a * b * c := mul_pos (mul_pos ha hb) hc
  field_simp [ha.ne', hb.ne', hc.ne']
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a * b - b * c), sq_nonneg (b * c - c * a), sq_nonneg (c * a - a * b)]