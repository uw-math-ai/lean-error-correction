theorem lean_workbook_plus_8504 (f : ℕ → ℕ) (a : ℕ) (h₁ : ∀ x, f x = 1) : f (f a) = 1   := by
  simp [h₁]