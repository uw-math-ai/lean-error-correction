theorem lean_workbook_plus_8920 (a : ℝ) (h : a = ∏ n in Finset.Icc 1 3, (9^n / 3^n)) : a = 729   := by
  simp [h, Finset.Icc]
  norm_num [LocallyFiniteOrder.finsetIcc]
  norm_num [List.map, List.range']