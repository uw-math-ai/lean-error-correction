theorem lean_workbook_plus_8510 : 10010 ≡ 35 [MOD 665]   := by
  conv => lhs; rw [← Nat.mod_add_div 10010 665]