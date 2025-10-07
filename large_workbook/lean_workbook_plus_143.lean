theorem lean_workbook_plus_143 (h : 1 + 1 = 2) : 1 / (1 + 1) = 1 / 2   := by
  simp [h, div_eq_mul_inv, mul_comm, mul_assoc, mul_left_comm]