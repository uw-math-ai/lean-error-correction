theorem lean_workbook_plus_9989 (a b c : ℝ) :
  5 * (a ^ 2 + b ^ 2 + c ^ 2) * (a + b + c) ≤ 6 * (a ^ 3 + b ^ 3 + c ^ 3) + (a + b + c) ^ 3 ↔
    a ^ 3 + b ^ 3 + c ^ 3 + 3 * a * b * c ≥ a ^ 2 * b + b ^ 2 * a + a ^ 2 * c + c ^ 2 * a + b ^ 2 * c + c ^ 2 * b   := by
  constructor <;> intro h <;> linarith