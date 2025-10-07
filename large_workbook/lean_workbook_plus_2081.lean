theorem lean_workbook_plus_2081 (t : ℝ) : t * (t - 1) * (t + 2) * (19 * t - 30) = 0 ↔ t = 0 ∨ t = 1 ∨ t = -2 ∨ t = 30 / 19   := by
  simp [mul_assoc, mul_comm, mul_left_comm]
  field_simp [sub_eq_zero, add_eq_zero_iff_eq_neg]