theorem lean_workbook_plus_8467 (x y : ℝ) : (1 / 3) * (x ^ 2 + x * y + y ^ 2) + 2 ≥ x + y + 1   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (x - 1), sq_nonneg (y - 1)]