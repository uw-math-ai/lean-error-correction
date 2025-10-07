theorem lean_workbook_plus_8208 : (9 : ℝ) / 9 = 1   := by
  norm_num [div_eq_mul_inv, mul_comm, mul_assoc, mul_left_comm]