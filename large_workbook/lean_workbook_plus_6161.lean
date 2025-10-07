theorem lean_workbook_plus_6161 (x y : ℤ) : x * (x - y ^ 2) = y ^ 2 - 76 ↔ x ^ 2 - x * y ^ 2 = y ^ 2 - 76   := by
  constructor <;> intro h <;> linarith