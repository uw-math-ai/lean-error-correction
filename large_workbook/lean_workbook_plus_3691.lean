theorem lean_workbook_plus_3691 : ℝ)(ha : a ≥ 0) : 5 * (a ^ 2 - a + 1) ^ 2 ≥ 2 * (1 + a ^ 4)   := by
  nlinarith [sq_nonneg (a - 1), sq_nonneg (a ^ 2 - 1)]