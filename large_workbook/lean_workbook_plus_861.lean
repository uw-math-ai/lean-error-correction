theorem lean_workbook_plus_861 (x y : ℝ) (hx : 0 < x) (hy : 0 < y) : 2*x^2*y + 2*x*y^2 + x^2 + y^2 + 2*x*y + 1 - x*y ≥ 3*(2*x*y + x + y)/2   := by
  have h1 : 0 ≤ (x - y)^2 := sq_nonneg (x - y)
  have h2 := sq_nonneg (x + y - 1)
  nlinarith [sq_nonneg (x - 1/2), sq_nonneg (y - 1/2)]