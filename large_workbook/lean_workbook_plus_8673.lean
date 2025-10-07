theorem lean_workbook_plus_8673 (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (h : 3*x + 5*y = 7) : 9*x^2 + 25*y^2 ≤ 49   := by
  nlinarith [sq_nonneg (3 * x + 5 * y), sq_nonneg (3 * x - 5 * y)]