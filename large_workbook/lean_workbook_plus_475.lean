theorem lean_workbook_plus_475 (a b : ℝ) : 2 * (1 + a ^ 2) * (1 + b ^ 2) ≥ (1 + a) * (1 + b) * (1 + a * b)   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a - 1), sq_nonneg (b - 1)]