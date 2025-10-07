theorem lean_workbook_plus_6672 (y : ℝ) : y^2 * (y^2 - y + 1) + 3 * (y - 1)^2 ≥ 0   := by
  nlinarith [sq_nonneg (y - 1), sq_nonneg (y ^ 2 - y + 1)]