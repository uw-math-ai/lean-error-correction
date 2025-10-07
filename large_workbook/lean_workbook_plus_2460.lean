theorem lean_workbook_plus_2460 (a b c d : ℝ) : (a^2 * b + c^2 * d) * (b + d) ≥ b * d * (a + c)^2   := by
  nlinarith [sq_nonneg (a * b - c * d)]