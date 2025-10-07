theorem lean_workbook_plus_6858 {a b c d : ℕ} (hab : a ≤ b) (hcd : c ≤ d) (h : a + c = b + d) : a = b ∧ c = d   := by
  exact ⟨Nat.le_antisymm hab (by omega), Nat.le_antisymm hcd (by omega)⟩