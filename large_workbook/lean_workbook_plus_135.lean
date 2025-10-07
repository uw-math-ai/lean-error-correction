theorem lean_workbook_plus_135 (a b c : ℝ) : (4/3 * a ^ 2 + 8/3 * b ^ 2 + 8 * a * c + 12 * c ^ 2) ≥ 0   := by
  nlinarith [sq_nonneg (a + 3 * c), sq_nonneg (a - 3 * c)]