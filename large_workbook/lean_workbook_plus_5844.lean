theorem lean_workbook_plus_5844 (a b : ℝ) : (b - a) / a * 100 = (100 * (b - a)) / a   := by
  simp [div_eq_mul_inv, mul_comm, mul_assoc, mul_left_comm]