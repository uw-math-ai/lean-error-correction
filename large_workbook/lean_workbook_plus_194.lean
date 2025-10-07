theorem lean_workbook_plus_194 (x : ℝ) (hx : x > 0) (h : x * (9 - x^2) = 10) : x^3 - 9 * x + 10 = 0   := by
  nlinarith [hx, h]