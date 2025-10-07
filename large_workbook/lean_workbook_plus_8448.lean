theorem lean_workbook_plus_8448 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (habc : a * b * c = 1) (h : a^2 = 4 * b * c) : (a + b + c) * (1 / a + 1 / b + 1 / c) ≥ 10   := by
  field_simp [ha.ne', hb.ne', hc.ne', habc]
  nlinarith [sq_nonneg (a - 2 * b), sq_nonneg (a - 2 * c)]