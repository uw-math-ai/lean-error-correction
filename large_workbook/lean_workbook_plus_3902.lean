theorem lean_workbook_plus_3902 (x y : ℝ) (hx: x > 2 ∧ y > 2) : x^2 + x*y + y^2 - 3*x - 3*y > 0   := by
  nlinarith [hx.1, hx.2]