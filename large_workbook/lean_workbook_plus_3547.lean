theorem lean_workbook_plus_3547 (a : ℕ → ℕ) (b : ℕ → ℕ) (h₁ : ∀ n, a n = (b n)^2) (h₂ : ∀ n, b n = 1) : a n = 1   := by
  simp [h₁, h₂]