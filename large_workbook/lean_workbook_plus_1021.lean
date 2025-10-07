theorem lean_workbook_plus_1021 ∑ k in Finset.Icc 0 23, (k+2).choose 2 = (26).choose 3   := by
  calc ∑ k in Finset.Icc 0 23, choose (k + 2) 2