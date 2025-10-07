theorem lean_workbook_plus_8058 (a b c x y z : ℝ) (ha : a ≥ 4) (hb : b ≥ 0) (hc : c ≥ 0) (hab : a + b ≤ 2 * c) : (a - 3) * (b - x ^ 2 - y ^ 2 - z ^ 2) ≤ (c - x - y - z) ^ 2   := by
  have h1 := sq_nonneg (a - 3 - (c - x - y - z))
  nlinarith [sq_nonneg (x - 1), sq_nonneg (y - 1), sq_nonneg (z - 1)]