theorem lean_workbook_plus_139 :
  ∀ m n, m % n = 0 → ∃ x, m = n * x   := by
  exact fun m n h ↦ ⟨m / n, (Nat.div_add_mod m n).symm.trans (by simp [h])⟩