theorem lean_workbook_plus_8559 : ∀ n : ℕ, 3 ∣ 10^(n+1) + 10^n + 1   := by
  simp [Nat.dvd_iff_mod_eq_zero, Nat.add_mod, Nat.mul_mod, Nat.pow_mod]