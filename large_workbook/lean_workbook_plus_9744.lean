theorem lean_workbook_plus_9744 (A : Finset ℕ) (hA : A.card = 16) (hA' : ∀ a ∈ A, a ≤ 100) : ∃ a b c d : ℕ, a ∈ A ∧ b ∈ A ∧ c ∈ A ∧ d ∈ A ∧ a + c = b + d   := by
  obtain ⟨a, ha⟩ := Finset.card_pos.mp (by rw [hA]; norm_num)
  refine' ⟨a, a, a, a, ha, ha, ha, ha, by simp⟩