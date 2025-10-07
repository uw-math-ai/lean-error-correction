theorem lean_workbook_plus_7381 (x y : ℝ) : ‖x - y‖ * ‖x + y‖ ≤ ‖x‖^2 + ‖y‖^2   := by
  have h1 : 0 ≤ (x - y) ^ 2 := sq_nonneg (x - y)
  have h2 : 0 ≤ (x + y) ^ 2 := sq_nonneg (x + y)
  simp [norm_eq_abs, abs_of_nonneg, pow_two] at h1 h2 ⊢
  nlinarith [abs_mul_abs_self (x - y), abs_mul_abs_self (x + y)]