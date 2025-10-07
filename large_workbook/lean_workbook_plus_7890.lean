theorem lean_workbook_plus_7890 (x y z: ℝ) : (x - y) ^ 2 + (y - z) ^ 2 + (z - x) ^ 2 ≥ 0   := by
  nlinarith [sq_nonneg (x - y), sq_nonneg (y - z), sq_nonneg (z - x)]