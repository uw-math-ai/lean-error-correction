theorem lean_workbook_plus_6938 :
  ∑ x in Finset.Icc 1 26, (x * (53 - x)) = ∑ x in Finset.Icc 1 26, (53 * x) - ∑ x in Finset.Icc 1 26, (x ^ 2)   := by
  congr 1 <;> simp [Finset.sum_range_succ, Finset.sum_range_zero]