theorem lean_workbook_plus_2041 :
  ∑ k in (Finset.range 31), (Nat.choose 30 k) = 2^30   := by
  conv => lhs; rw [← Nat.mod_add_div (∑ k in Finset.range 31, choose 30 k) 2]