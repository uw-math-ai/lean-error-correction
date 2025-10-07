theorem lean_workbook_plus_3153 (x : ℝ) (hx : 0 < x) : (2 * x / (x ^ 2 + 4) + 1 / (3 * x ^ 2 + 2)) ≤ 3 / 5   := by
  field_simp [hx, mul_comm, mul_assoc, mul_left_comm]
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [sq_nonneg (3 * x^2 + 2 - 5 * x)]