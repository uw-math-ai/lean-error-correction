theorem lean_workbook_plus_9321 (x y : ℝ) : x * (y - x) ≤ (x + (y - x))^2 / 4   := by
  linarith [sq_nonneg (x - (x + (y - x)) / 2)]