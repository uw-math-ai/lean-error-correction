theorem lean_workbook_plus_4044 : ∑ k in Finset.range 101, 2 * k = 10100   := by
  conv => lhs; rw [← Nat.mod_add_div (∑ k in Finset.range 101, 2 * k) 10]