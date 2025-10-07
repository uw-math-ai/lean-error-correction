theorem lean_workbook_plus_4705 (m n : ℝ) : 2 * (m ^ 2 - n ^ 2) ≥ 3 * m * n ↔ (2 * m + n) * (m - 2 * n) ≥ 0   := by
  constructor <;> intro h <;> linarith