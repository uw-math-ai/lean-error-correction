theorem lean_workbook_plus_7602 (n : ℕ) : ∑ j in Finset.range (n + 1), choose n j = 2 ^ n   := by
  rw [← Nat.sum_range_choose, Finset.sum_range_succ]