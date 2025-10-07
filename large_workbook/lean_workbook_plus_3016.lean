theorem lean_workbook_plus_3016 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (habc : a * b * c = 1) : a^3 * b + b^3 * c + c^3 * a >= a^(7 / 4) + b^(7 / 4) + c^(7 / 4)   := by
  simp [pow_three]
  nlinarith [mul_nonneg ha.le (sq_nonneg (b - c)), mul_nonneg hb.le (sq_nonneg (c - a)),
  mul_nonneg hc.le (sq_nonneg (a - b))]