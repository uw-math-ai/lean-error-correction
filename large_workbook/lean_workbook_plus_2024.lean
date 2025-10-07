theorem lean_workbook_plus_2024 (a : ℝ) : a^2 + 1 / 9 ≥ 2 / 3 * a   := by
  nlinarith [sq_nonneg (a - 1/3)]