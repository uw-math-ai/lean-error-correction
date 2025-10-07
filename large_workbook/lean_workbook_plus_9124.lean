theorem lean_workbook_plus_9124 (x y : ℕ) : (x = 0 ∨ 0 < x) ∧ (y = 0 ∨ 0 < y)   := by
  exact ⟨Nat.eq_zero_or_pos x, Nat.eq_zero_or_pos y⟩