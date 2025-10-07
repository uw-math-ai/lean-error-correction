theorem lean_workbook_plus_3264 : ∀ a : ℕ, a ^ 2 ≡ 0 [ZMOD 8] ∨ a ^ 2 ≡ 1 [ZMOD 8] ∨ a ^ 2 ≡ 4 [ZMOD 8]   := by
  intro a
  obtain ⟨k, rfl⟩ | ⟨k, rfl⟩ := Nat.even_or_odd a
  all_goals obtain ⟨k, rfl⟩ | ⟨k, rfl⟩ := Nat.even_or_odd k <;> simp [Nat.pow_succ]
  all_goals (ring_nf; simp [Int.ModEq])
  all_goals (ring_nf; omega)