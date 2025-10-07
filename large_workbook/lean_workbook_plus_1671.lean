theorem lean_workbook_plus_1671 : ∑ k in Finset.Icc 1 50, (k * (101 - k)) = 85850   := by
  conv => lhs; rw [← Nat.mod_add_div (∑ k in Finset.Icc 1 50, k * (101 - k)) 101]