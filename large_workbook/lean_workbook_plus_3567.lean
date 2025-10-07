theorem lean_workbook_plus_3567 (a b c : ℝ) (hab : a + b + c = 0) : a * b ^ 3 + b * c ^ 3 + c * a ^ 3 ≤ 0   := by
  rw [eq_neg_of_add_eq_zero_right hab]
  nlinarith [sq_nonneg (a + b), sq_nonneg a, sq_nonneg b]