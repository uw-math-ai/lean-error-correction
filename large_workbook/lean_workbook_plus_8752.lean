theorem lean_workbook_plus_8752 : 2 ^ 2000 ≡ 9 [MOD 13]   := by
  conv => lhs; rw [← Nat.mod_add_div 2000 12]