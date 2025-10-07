theorem lean_workbook_plus_9834 (a b m n : ℝ) : (n * a - m = m - n * b ↔ n * (a + b) = 2 * m)   := by
  constructor <;> intro h <;> linarith