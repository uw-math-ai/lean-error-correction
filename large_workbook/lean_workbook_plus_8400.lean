theorem lean_workbook_plus_8400 (x : ℤ) : x^5 - 1 = (x - 1) * (x^4 + x^3 + x^2 + x + 1)   := by
  linear_combination x^5 - 1 - (x - 1) * (x^4 + x^3 + x^2 + x + 1)