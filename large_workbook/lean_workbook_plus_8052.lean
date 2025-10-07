theorem lean_workbook_plus_8052 (a b : ℝ) (h₁ : a + b = 7) (h₂ : 2 * a - b = 17) : a - b = 9   := by
  linarith [h₁, h₂]