theorem lean_workbook_plus_6471 (a b x : ℕ) (hx: Nat.Coprime x b) : Nat.gcd a b = Nat.gcd (x * a) b   := by
  rw [Coprime.gcd_mul_left_cancel a hx]