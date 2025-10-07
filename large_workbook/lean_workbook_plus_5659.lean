theorem lean_workbook_plus_5659 (y z : ℝ) : 2 * y ^ 2 + 2 * z ^ 2 ≥ 4 * y * z   := by
  nlinarith [sq_nonneg (y - z), sq_nonneg (y + z)]