theorem lean_workbook_plus_9112 (a : ℝ) (ha : 0 < a) : a^5 + 1 ≥ a^3 + a^2   := by
  nlinarith [sq_nonneg (a^2 - 1), sq_nonneg (a^3 - 1)]