theorem lean_workbook_plus_6008 {n:ℕ | 1<= n ∧ n <= 2010 ∧ Nat.gcd n 2010 = 1} = {n:ℕ | 1<= n ∧ n <= 2010 ∧ Nat.gcd n 2 = 1 ∧ Nat.gcd n 3 = 1 ∧ Nat.gcd n 5 = 1 ∧ Nat.gcd n 67 = 1}   := by
  ext n
  simp [Nat.gcd_comm]
  rintro h₀ h₁
  interval_cases n <;> simp_all (config := {decide := true})