theorem lean_workbook_plus_8405 :
  (3 * choose 5 3 * choose 2 1 * choose 4 2) / (choose 9 3 * choose 6 3 * choose 3 3) = 3 / 14   := by
  norm_num [Nat.choose_eq_factorial_div_factorial, Nat.factorial]