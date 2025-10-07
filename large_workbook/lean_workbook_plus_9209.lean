theorem lean_workbook_plus_9209 (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hab : a + b + c = a * b * c + 2) : (a + b) * (b + c) * (c + a) + 2 ≥ 2 * (a * b + b * c + a * c) + 4 * a * b * c   := by
  have : 0 ≤ (a - b)^2 + (b - c)^2 + (c - a)^2 := by positivity
  nlinarith [sq_nonneg (a - 1), sq_nonneg (b - 1), sq_nonneg (c - 1)]