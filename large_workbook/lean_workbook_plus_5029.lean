theorem lean_workbook_plus_5029 (a : ℝ) : 3 * Real.sin a - 4 * (Real.sin a)^3 = Real.sin (3 * a)   := by
  simp [Real.sin_three_mul, sub_eq_add_neg, add_comm]