theorem lean_workbook_plus_4881 (a b c : ℝ) : ((a + b) ^ 2 - c ^ 2) * (c ^ 2 - (a - b) ^ 2) ≤ 4 * a ^ 2 * b ^ 2   := by
  ring_nf
  nlinarith [sq_nonneg (a^2 + b^2 - c^2)]