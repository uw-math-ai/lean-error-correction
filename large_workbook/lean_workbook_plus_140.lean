theorem lean_workbook_plus_140 (x y: ℝ): x ^ 2 + x + y ^ 2 + y + 1 ≥ x * y   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (x + 1), sq_nonneg (y + 1)]