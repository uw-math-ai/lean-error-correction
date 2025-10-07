theorem lean_workbook_plus_4157 (x y z : ℝ) (hx : x ≥ 0) (hy : y ≥ 0) (hz : z ≥ 0) (h : x + y^2 + z^3 = 1) : x^2 + y^2 + z^2 ≥ 3 / 4   := by
  have h2 : 0 ≤ (x - 1/2)^2 := sq_nonneg (x - 1/2)
  nlinarith