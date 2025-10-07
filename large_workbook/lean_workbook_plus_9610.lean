theorem lean_workbook_plus_9610 (a b : ℝ) (h : a * (a + 1) ^ 2 + b * (b + 1) ^ 2 = 8) : a + b ≤ 2   := by
  nlinarith [sq_nonneg (a - b), h]