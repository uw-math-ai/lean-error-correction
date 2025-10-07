theorem lean_workbook_plus_2420 (x y : ℝ) (hxy : 0 < x ∧ 0 < y) (h : x + y + x * y = 3) : x + y ≥ 2   := by
  nlinarith [sq_nonneg (x - 1), sq_nonneg (y - 1)]