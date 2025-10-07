theorem lean_workbook_plus_890 : ∀ n : ℕ, Odd (9^(n-1) + 3^(n-1) + 1)   := by
  simp [Nat.odd_iff_not_even, Nat.even_add, Nat.odd_iff_not_even, Nat.even_pow]
  simp [Nat.even_iff, Nat.mod_eq_of_lt]