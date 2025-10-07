theorem lean_workbook_plus_5606 (a b c : ℝ) (habc : a * b * c = 1) : 1 / (2 * a ^ 2 + b ^ 2 + 3) + 1 / (2 * b ^ 2 + c ^ 2 + 3) + 1 / (2 * c ^ 2 + a ^ 2 + 3) ≤ 1 / 2   := by
  field_simp [add_assoc, add_comm, add_left_comm]
  rw [div_le_iff (by positivity)]
  have := sq_nonneg (a^2 - b^2)
  nlinarith [sq_nonneg (b * c - a), sq_nonneg (c * a - b), sq_nonneg (a * b - c)]