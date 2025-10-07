theorem lean_workbook_plus_6620 (h₁ : 2 ≤ 23) : ∑ j in Finset.Icc 2 23, (1 / j - 1 / (j + 1)) = 11 / 24   := by
  calc ∑ j in Finset.Icc 2 23, (1 / j - 1 / (j + 1))