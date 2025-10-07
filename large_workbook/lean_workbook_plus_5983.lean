theorem lean_workbook_plus_5983 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) : 2 * Real.sqrt ((a^2 * b + b^2 * c + c^2 * a) * (a + b + c)) ≥ 2 * (a * b + b * c + c * a)   := by
  refine' mul_le_mul_of_nonneg_left _ (by positivity)
  have : 0 ≤ (a - b)^2 + (b - c)^2 + (c - a)^2 := by positivity
  apply le_sqrt_of_sq_le
  nlinarith [mul_nonneg ha.le hb.le, mul_nonneg hb.le hc.le, mul_nonneg hc.le ha.le]