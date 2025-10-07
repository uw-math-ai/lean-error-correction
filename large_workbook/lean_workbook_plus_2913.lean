theorem lean_workbook_plus_2913 (n : ℕ) : (n + 1) * (n + 3) < (n + 2) ^ 2   := by
  nlinarith [sq_nonneg (n + 1), sq_nonneg (n + 2)]