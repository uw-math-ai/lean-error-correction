theorem lean_workbook_plus_4672 ∀ n : ℕ, (∑ k in Finset.range (n+1), (Nat.choose n k)) - (n+1) + 1 = 2^n - n   := by
  intro n
  simp [Nat.sum_range_choose, Nat.pow_succ', Nat.add_succ_sub_one, add_comm]
  induction n <;> simp [Nat.add_succ, Nat.succ_add, *] <;> omega