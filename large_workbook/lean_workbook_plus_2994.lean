theorem lean_workbook_plus_2994 (x y : ℝ) : (x - y) ^ 2 + (x - 1) ^ 2 + (y - 1) ^ 2 ≥ 0   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (x - 1), sq_nonneg (y - 1)]