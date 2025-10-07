theorem lean_workbook_plus_6281 : Nat.choose 8 6 = 28   := by
  simp [Nat.choose_eq_factorial_div_factorial (by norm_num : 8 ≥ 6), Nat.factorial]