theorem lean_workbook_plus_3737 (f : ℕ → ℕ) (k : ℕ) (h₁ : ∀ k, f k = k * f 1) : ∀ k, f k = k * f 1   := by
  exact fun k ↦ h₁ k