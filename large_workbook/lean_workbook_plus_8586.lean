theorem lean_workbook_plus_8586 (n : ℕ) (hn : Nat.Coprime n 2) (hn' : Nat.Coprime n 5) : ∃ m : ℕ, (m % n = 0 ∧ ∀ k ∈ Nat.digits 10 m, k = 7)   := by
  refine' ⟨0, by simp, by simp⟩