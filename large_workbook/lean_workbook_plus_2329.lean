theorem lean_workbook_plus_2329 (a : ℝ) : (a^3 - a + 2)^2 > 4 * a^2 * (a^2 + 1) * (a - 2)   := by
  nlinarith [sq_nonneg (a^2 - 1), sq_nonneg (a - 1)]