theorem lean_workbook_plus_8296 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (habc : a * b * c = 1) (h : a^2 + b^2 + c^2 = 1) : a + b + c + 1 / (a * b * c) ≥ (4 * Real.sqrt 3 / 9) * (a + b + c) * (1 / a + 1 / b + 1 / c)   := by
  have h2 := sq_nonneg (a - b)
  nlinarith [ha, hb, hc, habc, h2, h]