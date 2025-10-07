theorem lean_workbook_plus_6081 (x : ℝ) : (x-2)*(x-4)*(x-6) = 0 ↔ x^3 - 12*x^2 + 44*x - 48 = 0   := by
  constructor <;> intro h <;> nlinarith