theorem lean_workbook_plus_4329 (a : ℤ) : (a + 1) ^ 2 - (a + 2) ^ 2 - (a + 3) ^ 2 + a ^ 2 = -8 * a - 12   := by
  linarith [sq (a + 1), sq (a + 2), sq (a + 3), sq a]