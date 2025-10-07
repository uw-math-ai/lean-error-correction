theorem lean_workbook_plus_6128 (a b c d : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hd : 0 < d) (hab : a + b ≥ 1 / 3 * (c + d)) (h : a^2 + b^2 = 1 / 3 * (c^2 + d^2)) : a^4 + a^2 * b^2 + b^4 ≤ 4 / 27 * (c^4 + c^2 * d^2 + d^4)   := by
  have h1 : 0 ≤ (a - b)^2 := sq_nonneg (a - b)
  nlinarith [sq_nonneg (a^2 - b^2), sq_nonneg (c^2 - d^2), hab, h]