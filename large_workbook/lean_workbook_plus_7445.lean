theorem lean_workbook_plus_7445 (S : Finset ℤ) (hS : S.card = 18) : ∃ a b, a ∈ S ∧ b ∈ S ∧ a - b ≡ 0 [ZMOD 17]   := by
  obtain ⟨a, ha⟩ := Finset.card_pos.1 (by linarith)
  refine' ⟨a, a, ha, ha, by simp [Int.ModEq]⟩