theorem lean_workbook_plus_4698  (a b c d : ℕ)
  (h₀ : a = 14)
  (h₁ : b + d = 18)
  (h₂ : c + d = 15)
  (h₃ : d = 11) :
  a + b + c + d = 36   := by
  simp_all [h₀, h₁, h₂, h₃, Nat.add_comm, Nat.add_assoc, Nat.add_left_comm]