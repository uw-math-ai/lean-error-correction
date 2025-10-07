theorem lean_workbook_plus_2944 (x y : ℝ) : x^4 + y^4 + (x^2 + 1) * (y^2 + 1) ≥ x^3 * (1 + y) + y^3 * (1 + x) + x + y   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (x - 1), sq_nonneg (y - 1)]