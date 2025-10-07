theorem lean_workbook_plus_3104 {a b c : ℝ} : (a - b) ^ 2 * (a ^ 2 + b ^ 2 - c ^ 2) + (b - c) ^ 2 * (b ^ 2 + c ^ 2 - a ^ 2) + (c - a) ^ 2 * (c ^ 2 + a ^ 2 - b ^ 2) ≥ 0   := by
  simp [sub_eq_add_neg, add_assoc, add_comm, add_left_comm]
  nlinarith [sq_nonneg (a + b + c), sq_nonneg (a + b - c), sq_nonneg (a - b + c), sq_nonneg (a - b - c)]