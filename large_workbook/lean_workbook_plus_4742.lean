theorem lean_workbook_plus_4742 (a b c : ℝ) : a * b + b * c + c * a ≤ (a + b + c) ^ 2 / 3   := by
  linarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]