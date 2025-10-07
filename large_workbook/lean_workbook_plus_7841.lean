theorem lean_workbook_plus_7841 (a b : ℝ) : -(a^2 + a * b + b^2)^2 ≤ 0   := by
  nlinarith [sq_nonneg (a^2 + a * b + b^2)]