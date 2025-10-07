theorem lean_workbook_plus_7040 (n : ℕ) (a : ℕ → ℤ) : |∑ i in Finset.range n, a i| ≤ ∑ i in Finset.range n, |a i|   := by
  exact Finset.abs_sum_le_sum_abs _ _