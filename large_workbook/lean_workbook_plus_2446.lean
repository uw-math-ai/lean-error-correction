theorem lean_workbook_plus_2446 (n : ℕ) : ∃ m, (m % 2 ^ n = 0 ∧ (∀ i ∈ Nat.digits 10 m, i = 1 ∨ i = 2))   := by
  refine' ⟨0, by simp, by simp⟩