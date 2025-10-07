theorem lean_workbook_plus_4319 (a b c : ℝ) : 2*a^2 - 2*a*(b + c - 3) + 2*(b^2 + c^2) - 2*b*c + 6*(1 - b) ≥ 0   := by
  simp [sq, mul_add, mul_comm, mul_left_comm]
  nlinarith [sq_nonneg (a - b - 1), sq_nonneg (b - c - 1), sq_nonneg (c - a - 1)]