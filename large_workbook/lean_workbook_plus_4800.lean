theorem lean_workbook_plus_4800 (n : ℕ) : ∑ k in Finset.range n, choose n k = 2^n - 1   := by
  simp [← Nat.sum_range_choose, Finset.sum_range_succ, choose_self]