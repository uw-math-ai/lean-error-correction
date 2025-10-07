theorem lean_workbook_plus_8581 (x : ℝ) : (18 / 17 + 6 * Real.sqrt 3 / 17) = (18 + 6 * Real.sqrt 3) / 17   := by
  norm_num [div_eq_mul_inv, mul_add, mul_comm, mul_left_comm]