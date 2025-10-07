theorem lean_workbook_plus_3410 (a b : ℝ) : 2 * a ^ 2 + b ^ 2 ≥ 2 * Real.sqrt 2 * a * b   := by
  have h : 0 ≤ (Real.sqrt 2 * a - b)^2 := sq_nonneg _
  simp [mul_add, add_mul, mul_comm, mul_left_comm] at h
  simp [sq, sub_mul, mul_sub, mul_comm, mul_assoc, mul_left_comm] at h
  linarith