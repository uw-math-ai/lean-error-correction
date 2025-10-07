theorem lean_workbook_plus_6564 :
  Nat.choose 6 3 * Nat.choose 5 2 = 200   := by
  simp [Nat.choose_eq_factorial_div_factorial, Nat.factorial]