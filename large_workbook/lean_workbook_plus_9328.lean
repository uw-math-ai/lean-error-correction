theorem lean_workbook_plus_9328 (k : ℤ) : (k ^ 2 ≡ 0 [ZMOD 3]) ∨ (k ^ 2 ≡ 1 [ZMOD 3]) ∨ (k ^ 2 ≡ -1 [ZMOD 3])   := by
  simp only [sq, Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]
  obtain ⟨n, rfl⟩ | ⟨n, rfl⟩ := Int.even_or_odd k <;> omega