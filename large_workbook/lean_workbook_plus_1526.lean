theorem lean_workbook_plus_1526 (a₁ a₂ y : ℝ) : a₂ - a₁ = y → a₂ = y + a₁   := by
  exact fun h ↦ by linarith [h]