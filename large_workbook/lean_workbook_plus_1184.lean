theorem lean_workbook_plus_1184 (n : ℕ) : ∑ k in Finset.Icc 1 n, (2 * k ^ 4 - k ^ 3 + 2 * k ^ 2 + 1) / (k + 2) ≥ 0   := by
  simp [Finset.sum_range_succ, Finset.sum_range_zero]