theorem lean_workbook_plus_8103 (a b c k : ℝ) (h : k > 0) : (1 + k) * (a ^ 4 + b ^ 4 + c ^ 4) ≥ a ^ 2 * b ^ 2 + (b ^ 2 + a ^ 2) * c ^ 2   := by
  have := sq_nonneg (a^2 - b^2)
  have := sq_nonneg (a^2 + b^2 - c^2)
  have := sq_nonneg (a^2 + b^2 + c^2)
  nlinarith [sq_nonneg (a^2 - b^2), sq_nonneg (b^2 - c^2), sq_nonneg (a^2 - c^2)]