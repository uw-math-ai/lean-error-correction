theorem lean_workbook_plus_1166 (a : ℝ) (ha : 0 < a) : (a + 2) ^ 3 / (27 * a) ≥ 1 / 4 + (a + 2) * (2 * a + 1) / (12 * a)   := by
  field_simp [mul_comm, mul_assoc, mul_left_comm]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (a - 2), sq_nonneg (a - 1), sq_nonneg a]