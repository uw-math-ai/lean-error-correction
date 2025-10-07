theorem lean_workbook_plus_4325 (x y : ℝ) (h1 : abs (2*x - y) ≤ 3) (h2 : abs (x - 3*y) ≤ 1) : x^2 + x*y + y^2 ≤ 7   := by
  nlinarith [abs_le.mp h1, abs_le.mp h2]