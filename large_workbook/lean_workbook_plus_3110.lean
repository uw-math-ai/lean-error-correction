theorem lean_workbook_plus_3110 (x y : ℝ) (h1 : 0 < x ∧ 0 < y) (h2 : x^3 + y^3 = x - y) : x^2 + y^2 < 1   := by
  nlinarith [sq_nonneg (x - 1), sq_nonneg (y - 1), h1.1, h1.2, h2]