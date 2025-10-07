theorem lean_workbook_plus_9491 (a b c : ℝ) : (a^2 + b^2 + c^2)^2 - 2 * a * b * c * (a + b + c) ≥ 2 * (a + b + c) * (a - b) * (b - c) * (a - c)   := by
  simp [sq, sub_eq_add_neg, add_assoc, add_comm, add_left_comm]
  nlinarith [sq_nonneg (a + b + c), sq_nonneg (a + b - c), sq_nonneg (a - b + c), sq_nonneg (a - b - c)]