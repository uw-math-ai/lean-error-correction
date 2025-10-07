theorem lean_workbook_plus_3637 (a b c : ℝ) :
  5 * (a ^ 2 + b ^ 2 + c ^ 2) ^ 2 ≥ 3 * (a ^ 2 * b * c + b ^ 2 * c * a + c ^ 2 * a * b) + 4 * (a ^ 2 + b ^ 2 + c ^ 2) * (a * b + b * c + c * a)   := by
  have h1 := sq_nonneg (a^2 - b^2)
  have h2 := sq_nonneg (b^2 - c^2)
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]