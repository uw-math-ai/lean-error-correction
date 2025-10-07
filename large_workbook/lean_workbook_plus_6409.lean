theorem lean_workbook_plus_6409 : ∀ n : ℕ, 6 ∣ n * (n^2 + 5)   := by
  simp [Nat.dvd_iff_mod_eq_zero, Nat.add_mod, Nat.mul_mod, Nat.pow_mod]
  intro n
  have h : n % 6 < 6 := Nat.mod_lt _ (by norm_num)
  interval_cases n % 6 <;> simp [Nat.pow_mod]