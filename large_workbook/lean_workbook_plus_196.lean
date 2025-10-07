theorem lean_workbook_plus_196 : a + b = 0 → a^2 + b^2 = -2 * a * b   := by
  intro h
  nlinarith [h]