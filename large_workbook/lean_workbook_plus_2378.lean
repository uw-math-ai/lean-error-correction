theorem lean_workbook_plus_2378 : ∀ n : ℤ, n ^ 2 ≡ 0 [ZMOD 4] ∨ n ^ 2 ≡ 1 [ZMOD 4]   := by
  intro n
  obtain ⟨k, rfl⟩ | ⟨k, rfl⟩ := Int.even_or_odd n <;> ring_nf <;> simp [Int.ModEq]