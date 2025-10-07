theorem lean_workbook_plus_6006 (Nat.choose 9 2)/(Nat.choose 12 2) = 6/11   := by
  norm_num [Nat.choose_eq_factorial_div_factorial, Nat.factorial]