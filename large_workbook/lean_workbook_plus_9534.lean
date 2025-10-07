theorem lean_workbook_plus_9534  (a b : ℝ) :
  2 * (a^2 + b^2) ≥ (a + b)^2   := by
  linarith [sq_nonneg (a - b)]