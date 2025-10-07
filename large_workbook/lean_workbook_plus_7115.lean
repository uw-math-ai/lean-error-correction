theorem lean_workbook_plus_7115 (n : ℕ) : ∑ k in Finset.Icc 3 99, (k * (k + 1) * (k + 2)) = 25497420   := by
  calc ∑ k in Finset.Icc 3 99, k * (k + 1) * (k + 2)