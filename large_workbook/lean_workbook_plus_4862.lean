theorem lean_workbook_plus_4862 (n m : ℕ) : choose n m + choose n (m + 1) = choose (n + 1) (m + 1)   := by
  simp [choose_succ_succ, add_comm, add_left_comm, add_assoc]