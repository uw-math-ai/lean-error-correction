theorem lean_workbook_plus_6105 (a b : ℝ) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2   := by
  simp [add_sq, mul_add, mul_comm, mul_left_comm]