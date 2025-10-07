theorem lean_workbook_plus_1525 (x : ℕ) (hx: x = 1023) : ∑ i in Finset.range 10, 2^i = x   := by
  simp [hx, Finset.sum_range_succ, Finset.sum_range_zero]