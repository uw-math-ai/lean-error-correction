theorem lean_workbook_plus_2046 (a b c : ℝ) : 2 * a ^ 4 + b ^ 4 + c ^ 4 - 4 * a ^ 2 * b * c ≥ 0   := by
  nlinarith [sq_nonneg (a^2 - b * c), sq_nonneg (b^2 - c^2), sq_nonneg (c^2 - a^2)]