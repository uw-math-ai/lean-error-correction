theorem lean_workbook_plus_8986 (a b c p : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) (hc : c ≥ 0) (hp : p ≥ 0) : (a + b * p) ^ 2 + (b + c * p) ^ 2 + (c + a * p) ^ 2 ≥ (1 + p) ^ 2 / 2 * (a ^ 2 + b ^ 2 + c ^ 2 + a * b + b * c + c * a)   := by
  field_simp [ha, hb, hc, hp]
  nlinarith [sq_nonneg (1 - p), sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]