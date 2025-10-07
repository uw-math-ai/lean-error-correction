theorem lean_workbook_plus_4520 (b : ℝ) : (1 + b) ^ 2 ≥ 4 * b ↔ (1 - b) ^ 2 ≥ 0   := by
  constructor <;> intro h <;> nlinarith