theorem lean_workbook_plus_9172 {a b c : ℝ} : (1^2 + 1^2 + 1^2) * (a^2 + b^2 + c^2) ≥ (a + b + c)^2   := by
  linarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]