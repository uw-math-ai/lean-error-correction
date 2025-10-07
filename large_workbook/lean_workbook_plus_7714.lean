theorem lean_workbook_plus_7714 (x y : ℝ) : x + 2*y = 5 ↔ y = -0.5*x + 2.5   := by
  ring_nf
  constructor <;> intro h <;> linarith