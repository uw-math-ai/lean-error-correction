theorem lean_workbook_plus_8804 (n : ℕ) : 4 * (n + 1) ^ 3 > (2 * n + 1) ^ 2 * (n + 2)   := by
  nlinarith [sq_nonneg (n + 1), sq_nonneg (n + 2)]