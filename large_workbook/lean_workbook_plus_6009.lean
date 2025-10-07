theorem lean_workbook_plus_6009 (a b c: ℝ) : a * b + b * c + c * a ≥ -1 / 2 ↔ 2 * (a * b + b * c + c * a) + 1 ≥ 0   := by
  constructor <;> intro h <;> linarith