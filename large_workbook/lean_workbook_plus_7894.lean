theorem lean_workbook_plus_7894  (x a b c : ℕ)
  (h₀ : 0 < a ∧ 0 < b ∧ 0 < c)
  (h₁ : x = 3 + 40 * a)
  (h₂ : x = 4 + 7 * b)
  (h₃ : b = 17 + 40 * c) :
  x ≡ 123 [MOD 280]   := by
  simp [h₁, h₂, h₃, Nat.ModEq, Nat.mod_eq_of_lt h₀.1, Nat.mod_eq_of_lt h₀.2.1, Nat.mod_eq_of_lt h₀.2.2]
  omega