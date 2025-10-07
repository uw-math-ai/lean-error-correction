theorem lean_workbook_plus_5318 (a b : ℝ) (ha : a > 0) (hb : b > 0) : a^2 - a * b + b^2 ≥ (a^2 + a * b + b^2) / 3   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a + b)]