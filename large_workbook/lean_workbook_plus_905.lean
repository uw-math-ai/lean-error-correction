theorem lean_workbook_plus_905 : (2 + Real.sqrt 3) + (2 - Real.sqrt 3) = 4   := by
  norm_num [add_comm, add_left_comm, add_assoc]