theorem lean_workbook_plus_1826 (x y : ℝ) : (|x| + |y|) ^ 2 ≥ (|x + y|) ^ 2   := by
  simp [sq, abs_add, add_assoc, add_comm, add_left_comm]
  nlinarith [abs_le.1 (abs_add x y)]