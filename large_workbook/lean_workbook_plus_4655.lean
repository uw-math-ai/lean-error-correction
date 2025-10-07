theorem lean_workbook_plus_4655 (L : ℕ → ℕ) (k : ℕ) (h₁ : k = 5) (h₂ : L 0 = 2) (h₃ : L 1 = 1) (h₄ : ∀ n, L (n + 2) = L (n + 1) + L n) : L k = 11   := by
  simp [h₁, h₂, h₃, h₄]