theorem lean_workbook_plus_1432 (a b c : ℝ) : (2 * a ^ 2 - 2 * a * b - 2 * a * c + b ^ 2 + c ^ 2) ^ 2 ≥ 0   := by
  nlinarith [sq_nonneg (2 * a ^ 2 - 2 * a * b - 2 * a * c + b ^ 2 + c ^ 2)]