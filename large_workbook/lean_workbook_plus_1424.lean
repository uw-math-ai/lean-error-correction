theorem lean_workbook_plus_1424 (a b c d : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hd : 0 < d) (habc : a * b * c > 0) (hcd : c * d * b > 0) (habd : a * b * d > 0) : (a^2 + b^2 ≥ c^2 + d^2) → b / (a + c) + a / (b + d) ≥ 1   := by
  intro h₁
  field_simp [ha, hb, hc, hd, habc, hcd, habd]
  rw [one_le_div (by positivity)]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - d), sq_nonneg (d - a)]