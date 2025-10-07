theorem lean_workbook_plus_1020 (X Y Z : ℕ) (h₁ : X % Y = Z % Y) : X ≡ Z [MOD Y]   := by
  simp [Nat.ModEq, h₁]