theorem lean_workbook_plus_6935 : (a + b) * (b + c) + (b + c) * (c + a) + (c + a) * (a + b) = a ^ 2 + b ^ 2 + c ^ 2 + 3 * (a * b + b * c + c * a)   := by
  ring