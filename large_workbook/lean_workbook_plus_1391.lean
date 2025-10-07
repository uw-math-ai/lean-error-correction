theorem lean_workbook_plus_1391 {n : ℤ} (h : n = m ^ 2) : n ≡ 0 [ZMOD 4] ∨ n ≡ 1 [ZMOD 4]   := by
  simp [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero, h]
  obtain ⟨k, rfl⟩ | ⟨k, rfl⟩ := Int.even_or_odd m <;> ring_nf <;> simp [Int.mod_self]