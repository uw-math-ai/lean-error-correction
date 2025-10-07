theorem lean_workbook_plus_6727 (x : ℂ) (a b c d : ℂ) :
  (a - x) * (d - x) - b * c = x^2 - (a + d) * x + (a * d - b * c)   := by
  linear_combination (a - x) * (d - x) - b * c