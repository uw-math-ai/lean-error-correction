theorem lean_workbook_plus_4739 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : (a / (a ^ 4 + b ^ 2) + b / (a ^ 2 + b ^ 4)) ≤ 1 / (a * b)   := by
  field_simp [ha, hb]
  have h1 := sq_nonneg (a^2 - b^2)
  have h2 := sq_nonneg (a^2 + b^2)
  have h3 := sq_nonneg (a^2 - b^2)
  have h4 := sq_nonneg (a^2 * b^2 - a * b)
  rw [div_le_div_iff (by positivity) (by positivity)]
  field_simp [ha.ne', hb.ne']
  have h5 := sq_nonneg (a^2 * b^2 + a * b)
  have h6 := sq_nonneg (a^2 * b^2 - a * b)
  have h7 := sq_nonneg (a * b)
  have h8 := sq_nonneg (a^2 * b^2 - a * b)
  have h9 := sq_nonneg (a^2 * b^2 - a * b)
  have h10 := sq_nonneg (a^2 * b^2 + a * b)
  ring_nf at h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 ⊢
  nlinarith [sq_nonneg (a^2 - b^2), sq_nonneg (a^3 - b^3), sq_nonneg (a^2 - 1), sq_nonneg (b^2 - 1)]