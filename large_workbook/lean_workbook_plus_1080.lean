theorem lean_workbook_plus_1080 : Nat.choose 9 4 = 126   := by
  simp only [Nat.choose_eq_factorial_div_factorial (by norm_num : 9 ≥ 4), Nat.factorial]