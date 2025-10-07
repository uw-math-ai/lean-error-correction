theorem lean_workbook_plus_9608 (n : ℤ) : (n - 1) * (n + 1) + 1 = n ^ 2   := by
  linarith [sq (n - 1), sq (n + 1)]