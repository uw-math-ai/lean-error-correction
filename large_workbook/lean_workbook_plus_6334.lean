theorem lean_workbook_plus_6334 (b : ℕ) (h₁ : ∃ k : ℕ, k^2 = (b + 1)) : ∃ l : ℕ, l^2 = 4 * (b + 1)   := by
  obtain ⟨k, hk⟩ := h₁
  exact ⟨2 * k, by ring_nf; rw [hk]; ring⟩