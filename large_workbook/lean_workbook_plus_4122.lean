theorem lean_workbook_plus_4122 (x y z : ℤ) : x^2 + y^2 = 2 * z^2 ↔ (x + y)^2 + (x - y)^2 = (2 * z)^2   := by
  constructor <;> intro h <;> linarith