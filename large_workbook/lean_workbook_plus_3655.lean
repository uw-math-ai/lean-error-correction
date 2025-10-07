theorem lean_workbook_plus_3655 (choose 10 4 < choose 10 5) = True   := by
  simp [Nat.choose_eq_factorial_div_factorial, Nat.factorial]