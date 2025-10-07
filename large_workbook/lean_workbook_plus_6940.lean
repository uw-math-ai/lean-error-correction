theorem lean_workbook_plus_6940 (a b : ℝ) : a^8 + b^8 ≥ (a^4 + b^4)^2 / 2   := by
  nlinarith [sq_nonneg (a^4 - b^4), sq_nonneg (a^4 + b^4)]