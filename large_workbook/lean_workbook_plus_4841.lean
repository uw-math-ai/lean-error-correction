theorem lean_workbook_plus_4841 (a b c : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 ≤ c) (hab : a + b + c = 3) : a^(1/3) + b^(1/3) + c^(1/3) ≥ b*c + c*a + a*b   := by
  norm_num [ha, hb, hc, hab]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]