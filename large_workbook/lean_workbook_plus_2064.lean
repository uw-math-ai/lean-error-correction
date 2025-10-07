theorem lean_workbook_plus_2064 : ∀ y : ℝ, y > 0 → y ^ 3 - y ^ 2 + 2 / 9 > 0   := by
  refine' fun y hy => _
  nlinarith [sq_nonneg (y - 1/3), sq_nonneg (y - 2/3)]