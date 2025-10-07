theorem lean_workbook_plus_3735 (a b : ℝ) (ha : 1 ≤ a) (hb : 1 ≤ b) : a * b * (a + 2 * b - 10) + 8 * (3 * a + b) ≥ 25   := by
  nlinarith [sq_nonneg (a - 2), sq_nonneg (b - 2)]