theorem lean_workbook_plus_4525 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (habc : a * b * c = 1) (hab : a^2 + b^2 + c^2 = 1) : 1 / (1 - a * b) + 1 / (1 - b * c) + 1 / (1 - c * a) ≤ 9 / 2   := by
  have h₁ := sq_nonneg (a - b)
  nlinarith [ha, hb, hc, habc, hab, h₁]