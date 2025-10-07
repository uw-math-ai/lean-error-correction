theorem lean_workbook_plus_246 (Nat.choose (4+218-1) 218) = 1774630   := by
  conv => lhs; rw [← Nat.mod_add_div 4 3, ← Nat.mod_add_div 218 3]