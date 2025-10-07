theorem lean_workbook_plus_6525 (a b c : ℝ) (h : a + b + c = a * b * c) :
  (a^2 + 1) * (b^2 + 1) * (c^2 + 1) ≥ (a * b + b * c + c * a - 1)^2   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]