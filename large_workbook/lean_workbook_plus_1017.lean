theorem lean_workbook_plus_1017 : 2 % 2 = 0   := by
  simp [Nat.mod_eq_of_lt (by norm_num : 2 < 2 * 2)]