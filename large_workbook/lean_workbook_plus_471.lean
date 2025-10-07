theorem lean_workbook_plus_471 :
  Finset.card (Finset.filter (λ x => 2 ∣ x ∨ 3 ∣ x ∨ 7 ∣ x) (Finset.range 750)) = 536   := by
  conv => lhs; rw [← Nat.mod_add_div 750 2, ← Nat.mod_add_div 750 3, ← Nat.mod_add_div 750 7]