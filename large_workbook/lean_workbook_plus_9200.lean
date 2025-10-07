theorem lean_workbook_plus_9200 (b : ℝ) : (49 * b^6 + 54 * b^5 + 155 * b^4 + 68 * b^3 + 139 * b^2 + 14 * b + 49) * (b - 1)^2 ≥ 0   := by
  simp [mul_add, add_mul, mul_comm, mul_left_comm]
  nlinarith [sq_nonneg (b - 1), sq_nonneg (b ^ 2 - b), sq_nonneg (b ^ 3 - b ^ 2), sq_nonneg (b ^ 4 - b ^ 3)]