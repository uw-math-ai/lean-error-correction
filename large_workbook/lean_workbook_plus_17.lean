theorem lean_workbook_plus_17 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (habc : a * b * c = 1) (h : a^4 + b^4 + c^4 = 1) : a^3 / (1 - a^8) + b^3 / (1 - b^8) + c^3 / (1 - c^8) ≥ 9 * (3 : ℝ)^(1 / 4) / 8   := by
  norm_num [ha, hb, hc, habc, h]
  have h1 := sq_nonneg (a^2 - 1)
  have h2 := sq_nonneg (b^2 - c^2)
  nlinarith