theorem lean_workbook_plus_5632 : ∑' i : ℕ, (1/(2^i)) = 1   := by
  rw [tsum_eq_single 0]
  all_goals simp [Nat.succ_eq_add_one]
  simp (config := { contextual := true }) [Nat.div_eq_of_lt]