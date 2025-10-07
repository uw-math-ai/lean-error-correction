theorem lean_workbook_plus_849 :
  (18 * 697 + 17) % 1920 = 1043   := by
  norm_num [Nat.mod_eq_of_lt (by norm_num : 1043 < 1920)]