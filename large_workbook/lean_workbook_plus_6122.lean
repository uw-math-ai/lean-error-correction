theorem lean_workbook_plus_6122 Nat.choose 16 4 - Nat.choose 14 4 = 819   := by
  norm_num [Nat.choose_eq_factorial_div_factorial, Nat.factorial]