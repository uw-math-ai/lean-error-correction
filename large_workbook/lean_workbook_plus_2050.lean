theorem lean_workbook_plus_2050 : Real.log 5 / Real.log 3 * (Real.log 7 / Real.log 5) = Real.log 7 / Real.log 3   := by
  norm_num [div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm]