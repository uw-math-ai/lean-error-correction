theorem lean_workbook_plus_2141 (a : ℕ → ℕ) (h : ∀ m, a m ∣ a (m + 1)) : ∀ m, m < n → Nat.gcd (a m) (a (m + 1)) = a m   := by
  intro m hmn
  exact Nat.gcd_eq_left (h m)