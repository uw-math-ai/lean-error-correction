theorem lean_workbook_plus_1380 (x : ℝ) : 2 * (Real.sin (150 * π / 180) - Real.sin (80 * π / 180)) = 1 - 2 * Real.sin (80 * π / 180)   := by
  simp [sub_eq_add_neg, mul_add, mul_comm, mul_left_comm]
  rw [show (π : ℝ) * 150 / 180 = 5 * π / 6 by ring]
  rw [show (5 : ℝ) * π / 6 = π / 2 + π / 3 by ring]
  simp [add_mul, sin_add, sin_pi_div_two, cos_pi_div_three]