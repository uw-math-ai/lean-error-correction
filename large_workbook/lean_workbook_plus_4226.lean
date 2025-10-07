theorem lean_workbook_plus_4226 : (1, 1, -2) + (2, -1, -1) = (3, 0, -3)   := by
  simp [add_comm, add_left_comm, add_assoc]