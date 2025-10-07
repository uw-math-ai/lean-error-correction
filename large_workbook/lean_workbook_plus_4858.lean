theorem lean_workbook_plus_4858 : ∀ a b n : ℤ, a ≡ b [ZMOD n] → n ∣ (a - b)   := by
  intro a b n h
  exact h.symm.dvd