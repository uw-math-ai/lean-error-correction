theorem lean_workbook_plus_8319 (n : ℕ) (x y : ℕ → ℕ) : (A - 2 * n * y 1) ^ 2 ≥ 0   := by
  nlinarith [sq_nonneg (A - 2 * n * y 1)]