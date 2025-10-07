theorem lean_workbook_plus_7915 (u v : ℝ) : (u^3 - u^2 * v - 2 * u * v^2 + v^3)^2 ≥ 0   := by
  nlinarith [sq_nonneg (u - v), sq_nonneg (u + v)]