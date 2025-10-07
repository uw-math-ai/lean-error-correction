theorem lean_workbook_plus_8864 : (Real.sqrt 5 + 2) ^ 3 * (Real.sqrt 5 - 2) ^ 3 = 1   := by
  simp [sub_eq_add_neg, add_comm, add_left_comm, add_assoc]
  simp [pow_three, mul_add, add_mul, mul_comm, mul_left_comm]
  ring