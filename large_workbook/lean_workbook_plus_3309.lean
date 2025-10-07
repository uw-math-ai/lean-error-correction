theorem lean_workbook_plus_3309 (a b c d : ℝ) (h1 : (4:ℝ)^a = 5) (h2 : (5:ℝ)^b = 6) (h3 : (6:ℝ)^c = 7) (h4 : (7:ℝ)^d = 8) : a*b*c*d = 3/2   := by
  rw [← Real.logb_eq_iff_rpow_eq] at h1 h2 h3 h4
  all_goals norm_num
  simp [h1, h2, h3, h4, logb, div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm]
  rw [← h1, ← h2, ← h3, ← h4]
  simp [h1, h2, h3, h4, show (4 : ℝ) = 2^2 by norm_num, show (5 : ℝ) = 2^2 + 1 by norm_num, show (6 : ℝ) = 2^2 + 2 by norm_num, show (7 : ℝ) = 2^2 + 3 by norm_num, show (8 : ℝ) = 2^3 by norm_num]
  simp [logb, Real.logb, show (2 : ℝ) ≠ 0 by norm_num, show (3 : ℝ) ≠ 0 by norm_num]
  norm_num [Real.logb, h1, h2, h3, h4]
  norm_num [div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm]