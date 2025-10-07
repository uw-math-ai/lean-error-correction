theorem lean_workbook_plus_2852 {m n : ℕ} (hmn : Nat.Coprime m n) :
    Nat.totient (m * n) = Nat.totient m * Nat.totient n   := by
  rw [totient_mul hmn, Nat.mul_comm]