theorem lean_workbook_plus_4804 (a b c : ℤ) : (a + b) * (b + c) * (c + a) = (a + b + c) * (a * b + b * c + c * a) - a * b * c   := by
  ring