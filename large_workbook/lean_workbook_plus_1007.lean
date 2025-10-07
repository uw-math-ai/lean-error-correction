theorem lean_workbook_plus_1007 :
  100 + 99 + 98 + 97 + 96 + 95 = 585   := by
  norm_num [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]