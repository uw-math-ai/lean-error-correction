theorem lean_workbook_plus_5093 (n : ℕ) : ∑ k in Finset.range (n+1), k * (k + 1) = n * (n + 1) * (n + 2) / 3   := by
  induction n <;> simp [Finset.sum_range_succ, *]
  simp [Nat.succ_eq_add_one, mul_add, add_mul, mul_comm, mul_assoc, mul_left_comm]
  ring
  omega