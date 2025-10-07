theorem lean_workbook_plus_5722 (a b : ℝ) : 2 * cos a * cos b = cos (a + b) + cos (a - b)   := by
  simp [cos_add, cos_sub, mul_add, mul_sub, mul_comm, mul_left_comm]
  ring