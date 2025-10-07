theorem lean_workbook_plus_9035 (n : ℕ) (h : n ≥ 3) : n^2 ≥ 2*n+1   := by
  nlinarith [sq_nonneg (n - 1)]