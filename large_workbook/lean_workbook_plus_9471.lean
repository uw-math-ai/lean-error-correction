theorem lean_workbook_plus_9471 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : 4 * (a^2 - a * b + b^2) ≥ (a + b)^2   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a + b)]