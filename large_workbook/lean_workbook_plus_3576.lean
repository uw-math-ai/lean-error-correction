theorem lean_workbook_plus_3576 : (1000 * 1001 / 2 - (2^10 - 1)) % 1000 = 477   := by
  norm_num [Nat.mod_eq_of_lt]