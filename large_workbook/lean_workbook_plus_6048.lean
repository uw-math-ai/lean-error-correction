theorem lean_workbook_plus_6048 (Nat.choose 64 2) = 2016   := by
  norm_num [Nat.choose_eq_factorial_div_factorial, Nat.factorial]