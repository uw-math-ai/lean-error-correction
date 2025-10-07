theorem lean_workbook_plus_3778 : (x^2 + x + 2)^2 = x^4 + 2*x^3 + 5*x^2 + 4*x + 4   := by
  linarith [pow_two (x^2 + x + 2)]