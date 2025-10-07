theorem lean_workbook_plus_4427 (a b c d : ℝ) (h : a + d = b + c) :
  (a - b) * (c - d) + (a - c) * (b - d) + (d - a) * (b - c) ≥ 0   := by
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - d), sq_nonneg (d - a)]