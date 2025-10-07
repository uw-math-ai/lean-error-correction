theorem lean_workbook_plus_2428 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a ≤ 2 * b) (h : 2 * b ≤ 3 * a) : a^2 + b^2 ≤ 5 / 2 * a * b   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a - 2 * b)]