theorem lean_workbook_plus_7609 (a : ℝ) : Real.sin (3 * a) = -4 * (Real.sin a)^3 + 3 * (Real.sin a)   := by
  simp [Real.sin_three_mul, sub_eq_add_neg, add_comm, add_left_comm, add_assoc]