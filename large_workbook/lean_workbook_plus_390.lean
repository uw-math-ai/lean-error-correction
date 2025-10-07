theorem lean_workbook_plus_390 (n : ℕ) (a : ℕ → ℕ) (a1 : a 0 = 1) (a_rec : ∀ n, a (n + 1) = a n ^ 2 + a n + 1) : (a n ^ 2 + 1) ∣ (a (n + 1) ^ 2 + 1)   := by
  simp [a1, a_rec]
  exact ⟨a n ^ 2 + 2 * a n + 2, by ring⟩