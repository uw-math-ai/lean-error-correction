theorem lean_workbook_plus_9036 (a b c : ℤ) : a^3 + b^3 + c^3 - 3*a*b*c = (a + b + c) * (a - b)^2 + (a + b + c) * (a - c) * (b - c)   := by
  ring