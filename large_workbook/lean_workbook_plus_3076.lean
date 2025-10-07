theorem lean_workbook_plus_3076 (a b : ℝ) : a / b = 1 / (b / a)   := by
  simp [div_eq_mul_inv, mul_comm, mul_assoc, mul_left_comm]