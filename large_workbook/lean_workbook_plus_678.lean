theorem lean_workbook_plus_678 : ∑ k in (Nat.divisors 12), k = 28   := by
  conv_lhs => rw [← Nat.mod_add_div 12 2]