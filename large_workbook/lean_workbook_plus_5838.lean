theorem lean_workbook_plus_5838 (a b m : ℤ) (n : ℕ) (h₁ : a ≡ b [ZMOD m]) : a ^ n ≡ b ^ n [ZMOD m]   := by
  induction n <;> simp [*, pow_succ, Int.ModEq.mul]