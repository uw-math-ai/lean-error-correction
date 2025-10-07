theorem lean_workbook_plus_8050 (x : ℝ) : (3^2 + 4^2 - 2*3*4*x = 5^2 + 6^2 - 2*5*6*(-x)) ↔ x = -3/7   := by
  constructor <;> intro h <;> linarith