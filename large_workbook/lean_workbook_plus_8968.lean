theorem lean_workbook_plus_8968 : choose 3 0 + choose 4 1 + choose 5 2 = choose 6 2   := by
  simp [Nat.choose_succ_succ, Nat.choose_symm_of_eq_add]