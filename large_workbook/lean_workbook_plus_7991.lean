theorem lean_workbook_plus_7991 (a b : ℕ) : Nat.Coprime a b → Nat.Coprime (a * b) (a + b)   := by
  simp [Nat.coprime_comm]
  simp [Nat.coprime_comm, Nat.coprime_mul_iff_left, Nat.coprime_mul_iff_right]