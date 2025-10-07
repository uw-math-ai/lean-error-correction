theorem lean_workbook_plus_6324 (x y : ℝ) (b : ℝ) (h₁ : y = 3 * x + b) (h₂ : x = -b / 3) : y = 0   := by
  linarith [h₁, h₂]