theorem lean_workbook_plus_6373 (a b : ℝ) : (a^4 + 1) * (1 + b^4) ≥ (a^2 + b^2)^2   := by
  nlinarith [sq_nonneg (a^2 - b^2), sq_nonneg (a^2 * b^2 - 1)]