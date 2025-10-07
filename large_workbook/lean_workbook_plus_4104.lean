theorem lean_workbook_plus_4104 (n : ℕ) : ∑ k in Finset.range (n+1), Nat.choose n k = 2^n   := by
  rw [← Nat.sum_range_choose n, Finset.sum_range_succ]