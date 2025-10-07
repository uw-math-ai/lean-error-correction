theorem lean_workbook_plus_1625 (a : ℝ) (x : ℝ) (h₁ : 0 < a ∧ a < 1) (h₂ : x = 2 + a) : a = x - 2   := by
  linarith [h₁.1, h₁.2, h₂]