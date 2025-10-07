theorem lean_workbook_plus_2166 (x y : ℝ) : 4*x = -3*y + 8 ↔ y = -4/3*x + 8/3   := by
  constructor <;> intro h <;> linarith