theorem lean_workbook_plus_9177 (a b : ℝ) (h₁ : a = 3) (h₂ : b = a * Real.sqrt 2) : b = 3 * Real.sqrt 2   := by
  rw [h₂, h₁]