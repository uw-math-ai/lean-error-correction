theorem lean_workbook_plus_5089 (n r : ℕ) : choose n r + choose n (r + 1) = choose (n + 1) (r + 1)   := by
  simp [choose_succ_succ, add_comm, add_left_comm, add_assoc]