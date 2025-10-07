theorem lean_workbook_plus_3586 (x a : ℝ) : (3 - x) ^ 2 ≥ 4 * (x ^ 2 - 3 * x + a) ↔ (x - 1) ^ 2 ≤ 4 - 4 * a / 3   := by
  constructor <;> intro h <;> linarith [h]