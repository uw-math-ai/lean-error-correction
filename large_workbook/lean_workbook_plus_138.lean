theorem lean_workbook_plus_138 (x : ℝ) : x ^ 2 ≥ 0   := by
  nlinarith [sq_nonneg x]