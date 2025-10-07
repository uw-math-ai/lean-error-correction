theorem lean_workbook_plus_3775  (n : ℕ)
  (a : ℕ → ℕ)
  (h₀ : 0 < n)
  (h₁ : ∀ i, 0 < i → a i ≥ a (i + 1)) :
  ∀ i, 0 < i → a i - 1 ≥ a (i + 1) - 1   := by
  exact fun i hi ↦ Nat.sub_le_sub_right (h₁ i hi) 1