theorem lean_workbook_plus_5709 (x y : ℤ) : (16*x + 56)*(2*x^2 + 14*x + 56) = 4*y^3 ↔ (2*x + 7)^3 + 63*(2*x + 7) = y^3   := by
  constructor <;> intro h <;> linarith