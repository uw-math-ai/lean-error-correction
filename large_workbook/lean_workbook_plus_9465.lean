theorem lean_workbook_plus_9465 (n : ℕ) : choose (n + 2) 4 = choose n 2 + 2 * choose n 3 + choose n 4   := by
  simp [choose_succ_succ, add_comm, add_left_comm, add_assoc]
  ring