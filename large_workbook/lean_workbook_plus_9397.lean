theorem lean_workbook_plus_9397 (a b c : ℝ) : (a ^ 3 + b ^ 3 + c ^ 3) * (a + b + c) ≥ (a * b + b * c + a * c) * (a ^ 2 + b ^ 2 + c ^ 2)   := by
  have h1 := sq_nonneg (a^2 - b^2)
  have h2 := sq_nonneg (b^2 - c^2)
  nlinarith [sq_nonneg (a + b + c), sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]