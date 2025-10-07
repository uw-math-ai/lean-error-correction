theorem lean_workbook_plus_2801 (Nat.choose 7 2) < 6 * (Nat.choose 3 2) + 4 * (Nat.choose 2 2)   := by
  norm_num [Nat.choose_eq_factorial_div_factorial, Nat.factorial]