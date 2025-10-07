theorem lean_workbook_plus_6475 (f : ℕ → ℕ) : ∑ i in Finset.Icc 5 78, (i^2 - i + 3) = 158360   := by
  calc ∑ i in Finset.Icc 5 78, (i ^ 2 - i + 3)