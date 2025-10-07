theorem lean_workbook_plus_7931 (x y z : ℝ) (h : x + y + z = 2) : xy ≥ 0   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]