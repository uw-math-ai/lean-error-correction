theorem lean_workbook_plus_1714 : 2 ^ 2011 + 3 ^ 2011 + 4 ^ 2011 + 5 ^ 2011 + 6 ^ 2011 + 7 ^ 2011 + 8 ^ 2011 + 2011 ≡ 3 [ZMOD 9]   := by
  conv => lhs; rw [← Nat.mod_add_div 2011 9]