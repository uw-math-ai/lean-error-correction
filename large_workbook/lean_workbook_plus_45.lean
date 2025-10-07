theorem lean_workbook_plus_45 :
  (5^(2*1) ≡ 25 [MOD 100])   := by
  conv => lhs; rw [← Nat.mod_add_div 5 100, ← Nat.mod_add_div 5 100]