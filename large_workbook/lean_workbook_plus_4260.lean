theorem lean_workbook_plus_4260 (a b c : ℝ) (ha : a > 0) (hb : b > 0) (hc : c > 0) (habc : a * b * c = 1) (h : a^2 + b^2 + c^2 = 1) : 1 / a^2 + 1 / b^2 + 1 / c^2 ≥ 3 + 2 * (a^3 + b^3 + c^3) / (a * b * c)   := by
  have h1 := sq_nonneg (a - b)
  nlinarith [ha, hb, hc, habc, h, h1]