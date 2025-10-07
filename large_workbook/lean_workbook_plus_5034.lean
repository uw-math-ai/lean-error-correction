theorem lean_workbook_plus_5034 (a b : ℝ) (h₁ : a + b = 24) (h₂ : a = 3 * b / 5) : b = 15   := by
  linarith [h₁, h₂]