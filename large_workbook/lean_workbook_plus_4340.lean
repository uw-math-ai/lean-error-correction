theorem lean_workbook_plus_4340 : Real.logb 3 (2^102) = 102 * Real.logb 3 2   := by
  simp [Real.logb, div_eq_mul_inv, mul_comm, mul_assoc, mul_left_comm]