theorem lean_workbook_plus_4188 (a b : ℝ) (h₁ : a + b = 50) (h₂ : a * b = 25) : 1 / a + 1 / b = 2   := by
  rw [div_add_div]
  norm_num [h₁, h₂]
  all_goals nlinarith [h₁, h₂]