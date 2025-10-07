theorem lean_workbook_plus_5574 (a b x : ℝ) (hab : a < 0 ∧ b < 1) : a * b ^ x = a * b ^ x   := by
  simp [hab.1, hab.2, mul_comm, mul_assoc, mul_left_comm]