theorem lean_workbook_plus_5754 (p : ℝ) : 36 + 2 * (p ^ 3 / 3) ≥ 18 * p ↔ (p - 3) ^ 2 * (p + 6) ≥ 0   := by
  constructor <;> intro h <;> nlinarith [h]