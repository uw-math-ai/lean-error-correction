theorem lean_workbook_plus_7364 (x y z : ℂ) : (x^3 - 6 * z^2 + 12 * z - 8 = 0 ∧ x = y ∧ y = z) ↔ x^3 - 6 * z^2 + 12 * z - 8 = 0 ∧ x = z ∧ y = z   := by
  constructor <;> intro h <;> aesop