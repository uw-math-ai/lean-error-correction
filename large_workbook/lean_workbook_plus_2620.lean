theorem lean_workbook_plus_2620 (a b : ℝ) : (a^2 + 2) * (b^2 + 2) ≥ 3 * ((a + b)^2 / 2 + 1)   := by
  simp [sq, mul_add, mul_comm, mul_left_comm]
  nlinarith [sq_nonneg (a * b - 1), sq_nonneg (a - b)]