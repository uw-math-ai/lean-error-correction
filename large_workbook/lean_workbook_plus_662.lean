theorem lean_workbook_plus_662 : ∀ a b : ℤ, Odd a ∧ Odd b → Even (a^2 + b^2 + 26) ∧ Odd (5 * a * b)   := by
  rintro a b ⟨⟨c, rfl⟩, ⟨d, rfl⟩⟩
  simp [Int.even_add, Int.even_mul, Int.even_pow]
  decide