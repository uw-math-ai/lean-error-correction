theorem lean_workbook_plus_5685 (z : ℤ) (h₁ : ℤ → ℤ) (h₂ : ℤ → ℤ) (h₃ : ℤ → ℤ) : (h₃ ∘ h₂ ∘ h₁) z = h₃ (h₂ (h₁ z))   := by
  simp only [Function.comp_apply]