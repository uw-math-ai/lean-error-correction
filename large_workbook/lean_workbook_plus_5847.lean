theorem lean_workbook_plus_5847 (n k : ℕ) : ∑ i in Finset.range (k+1), choose (n+i) n = choose (n+k+1) (n+1)   := by
  induction k <;> simp [Finset.sum_range_succ, *]
  rw [add_assoc, choose_succ_succ, add_comm]