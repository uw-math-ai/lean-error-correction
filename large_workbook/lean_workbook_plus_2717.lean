theorem lean_workbook_plus_2717 {a b c : ℝ} : (a + b + c) ^ 2 ≥ 3 * (a * b + b * c + a * c)   := by
  linarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]