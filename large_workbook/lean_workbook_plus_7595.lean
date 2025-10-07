theorem lean_workbook_plus_7595 (a b c : ℝ) : a^2 * b + b^2 * c + c^2 * a + a * b * c ≤ 4 ↔ a^2 * b + b^2 * c + c^2 * a ≤ 4 - a * b * c   := by
  constructor <;> intro h <;> linarith