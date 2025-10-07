theorem lean_workbook_plus_3918 : (Real.sqrt 3) * (3 * Real.sqrt 3) = 9   := by
  norm_num [mul_assoc, mul_comm, mul_left_comm]