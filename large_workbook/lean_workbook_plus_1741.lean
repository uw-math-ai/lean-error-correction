theorem lean_workbook_plus_1741 (a b c : ℝ) : a^2 + b^2 + c^2 - a * b - b * c - c * a ≥ 0   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]