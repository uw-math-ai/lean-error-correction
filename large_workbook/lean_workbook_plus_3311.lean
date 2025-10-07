theorem lean_workbook_plus_3311 (n : ℕ) : ∑ i in Finset.range n, (1/2)^i = (1 - (1/2)^n)/(1 - 1/2)   := by
  simp [Finset.sum_range_succ, Finset.sum_range_zero]
  split_ifs with h <;> simp [h]