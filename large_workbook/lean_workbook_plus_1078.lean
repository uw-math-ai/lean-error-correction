theorem lean_workbook_plus_1078 :
  ∑ k in (Finset.range 101), 2 * (k * (k + 1) / 2) = 343400   := by
  conv_lhs => rw [← Nat.mod_add_div (∑ k in Finset.range 101, 2 * (k * (k + 1) / 2)) 10000]