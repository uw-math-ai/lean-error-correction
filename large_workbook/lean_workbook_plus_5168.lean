theorem lean_workbook_plus_5168 (a b c d : ℝ) (hab : a + b + c + d = 0) : (a * b * c + b * c * d + c * d * a + d * a * b) ^ 2 = |(b * c - a * d) * (c * a - b * d) * (a * b - c * d)|   := by
  have : a = -(b + c + d) := by linarith
  subst this
  field_simp [add_comm] at hab ⊢
  simp [sq, abs_mul, abs_eq_max_neg]
  have h1 := sq_nonneg (b * c - (-b + -c + -d) * d)
  simp [max_def, hab]
  split_ifs <;> nlinarith