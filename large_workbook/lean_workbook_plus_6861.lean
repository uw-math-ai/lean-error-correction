theorem lean_workbook_plus_6861 (k u v : ℕ) (h₁ : 2 * k + 1 = u ^ 2) (h₂ : 3 * k + 1 = v ^ 2) : ∃ k u v : ℕ, 2 * k + 1 = u ^ 2 ∧ 3 * k + 1 = v ^ 2   := by
  exact ⟨k, u, v, h₁, h₂⟩