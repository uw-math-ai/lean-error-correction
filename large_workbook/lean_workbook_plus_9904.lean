theorem lean_workbook_plus_9904 : 10 + 11 + 12 + 13 + 14 + 15 = 75   := by
  simp only [Nat.add_comm, Nat.add_left_comm, Nat.add_assoc]