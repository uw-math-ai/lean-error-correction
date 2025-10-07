theorem lean_workbook_plus_9088 (p : ℝ → ℝ) (hp : ∀ x, p x = x) : ∀ x, p x = x   := by
  exact fun x ↦ hp x