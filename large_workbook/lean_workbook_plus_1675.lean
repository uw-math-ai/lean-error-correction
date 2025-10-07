theorem lean_workbook_plus_1675 (x y : ℝ) : x^3 + y^3 = (x + y) * (x^2 - x * y + y^2)   := by
  linear_combination x^3 + y^3 - (x + y) * (x^2 - x * y + y^2)