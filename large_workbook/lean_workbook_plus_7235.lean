theorem lean_workbook_plus_7235 :
  (11 + 3) % 12 = 2   := by
  simp only [Nat.add_mod, Nat.mod_eq_of_lt (by norm_num : 3 < 12), Nat.mod_eq_of_lt (by norm_num : 11 < 12)]