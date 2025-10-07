theorem lean_workbook_plus_5464 (l₁ l₂ l₃ : ℝ) (h₁ : l₁ = 100) (h₂ : l₂ = 30) (h₃ : l₃ = 50) : l₁ * l₂ * l₃ = 150000   := by
  norm_num [h₁, h₂, h₃]