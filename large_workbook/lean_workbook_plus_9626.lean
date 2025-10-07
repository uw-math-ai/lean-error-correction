theorem lean_workbook_plus_9626 :
  ∑ k in Finset.Icc 1 9, (Nat.choose 9 k) = 511   := by
  conv => lhs; rw [← Nat.mod_add_div (∑ k in Finset.Icc 1 9, choose 9 k) 10]