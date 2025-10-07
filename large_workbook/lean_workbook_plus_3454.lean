theorem lean_workbook_plus_3454 : ∀ x₁ x₂ : ℝ, (1 - x₁) * (1 - x₂) ≥ 1 - x₁ - x₂ + x₁ * x₂   := by
  exact fun x₁ x₂ ↦ by nlinarith [sq_nonneg (x₁ - x₂)]