theorem lean_workbook_plus_1858 (x : ℝ) : (18 / 3) + 2 * Real.sqrt 3 = 6 + 2 * Real.sqrt 3   := by
  norm_num [div_eq_mul_inv, mul_comm, mul_assoc, mul_left_comm]