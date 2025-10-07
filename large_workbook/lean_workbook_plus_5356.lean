theorem lean_workbook_plus_5356 : 5 ∣ 3^3 - 3 + 1   := by
  norm_num [Nat.dvd_iff_mod_eq_zero, Nat.mod_eq_zero_of_dvd]