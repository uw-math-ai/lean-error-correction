theorem lean_workbook_plus_699 :
  ∑ k in (Finset.Icc 1 63), (1 / (k^2 + k + 1)) = 2015 / 12099   := by
  calc ∑ k in Finset.Icc 1 63, 1 / (k^2 + k + 1)