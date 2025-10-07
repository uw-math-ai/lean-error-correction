theorem lean_workbook_plus_2690 (a b c : ℝ) : a^2 + b^2 + c^2 + 4 * a * b ≥ 2 * (a * b + b * c + c * a)   := by
  nlinarith [sq_nonneg (a + b - c), sq_nonneg (a - b + c), sq_nonneg (-a + b + c)]