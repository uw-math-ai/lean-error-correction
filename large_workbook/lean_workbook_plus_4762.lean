theorem lean_workbook_plus_4762 : ∃ x:ℕ, 10^x ≡ 1 [ZMOD 3^2005]   := by
  refine' ⟨0, by simp [Int.ModEq]⟩