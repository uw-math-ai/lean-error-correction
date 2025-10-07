theorem lean_workbook_plus_6115 (n r : ℕ) : ∃ k, k = n.choose r   := by
  exact ⟨choose n r, rfl⟩