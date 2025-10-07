theorem lean_workbook_plus_5848 :
  Nat.choose (5 + 12 - 1) 12 = Nat.choose 16 4   := by
  norm_num [Nat.choose_eq_factorial_div_factorial, Nat.factorial]