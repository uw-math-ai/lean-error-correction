theorem lean_workbook_plus_3670 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) : (a + b) ^ 3 / 4 ≥ a ^ 2 * b + a * b ^ 2   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a + b)]