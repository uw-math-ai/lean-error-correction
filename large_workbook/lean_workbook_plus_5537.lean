theorem lean_workbook_plus_5537 (x y : ℝ) (h₁ : y ≠ 0) (h₂ : 7 - (x - y) ^ 2 = 2 * (x - y) - 8) : (x - y) ^ 2 + 2 * (x - y) - 15 = 0   := by
  linarith [h₁, h₂]