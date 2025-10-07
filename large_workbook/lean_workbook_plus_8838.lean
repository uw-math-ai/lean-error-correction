theorem lean_workbook_plus_8838 (a b c : ℝ) : (a + c) ^ 2 * (b + c) ^ 2 ≥ 4 * c * (a + b) * (c ^ 2 + a * b)   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (a - c), sq_nonneg (b - c)]