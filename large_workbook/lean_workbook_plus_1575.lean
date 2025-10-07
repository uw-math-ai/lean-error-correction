theorem lean_workbook_plus_1575 (n : ℕ) : ∑ i in Finset.range n, (1 / (2^(i + 1))) < 1   := by
  induction n <;> simp [Finset.sum_range_succ, *]
  simp [Finset.sum_range_succ, Nat.div_eq_of_lt]