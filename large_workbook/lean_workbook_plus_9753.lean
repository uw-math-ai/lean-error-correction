theorem lean_workbook_plus_9753 (a : ℕ → ℕ) (a0 : a 0 = 6) (a_rec : ∀ n, a (n+1) = (2*n+2)*a n - 15*n - 10) : ∃ f : ℕ → ℕ, ∀ n, a n = f n   := by
  refine' ⟨fun n ↦ a n, fun n ↦ rfl⟩