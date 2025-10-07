theorem lean_workbook_plus_9577 (x y : ℝ) : (x^2 + 3 * x * y + y^2)^2 * (2 * x^2 + 3 * x * y + 2 * y^2) ≥ 0   := by
  nlinarith [sq_nonneg (x + y), sq_nonneg (x - y)]