theorem lean_workbook_plus_2950 (a b c : ℝ) :
  (a + b + c) ^ 3 ≥ (9 / 4) * (a * (b + c) ^ 2 + b * (c + a) ^ 2 + c * (a + b) ^ 2) ↔
    4 * (a ^ 3 + b ^ 3 + c ^ 3) + 3 * (a * (b ^ 2 + c ^ 2) + b * (c ^ 2 + a ^ 2) + c * (a ^ 2 + b ^ 2)) ≥
      30 * a * b * c   := by
  constructor <;> intro h <;> linarith