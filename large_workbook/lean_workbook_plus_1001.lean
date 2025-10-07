theorem lean_workbook_plus_1001 (Nat.choose 11 5) - (Nat.choose 5 2 * Nat.choose 6 3) = 262   := by
  conv => lhs; rw [← Nat.mod_add_div 11 5, ← Nat.mod_add_div 5 2, ← Nat.mod_add_div 6 3]