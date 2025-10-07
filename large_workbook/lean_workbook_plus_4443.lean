theorem lean_workbook_plus_4443 (n : ℕ) (a : ℕ → ℕ) : 1/2 * ∑ i in Finset.range n, a i ≤ 1/6 * ∑ i in Finset.range n, (a i ^ 3 + 1 + 1)   := by
  simp [Finset.sum_range_succ, Finset.sum_range_zero]