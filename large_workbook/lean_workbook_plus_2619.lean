theorem lean_workbook_plus_2619 (x : ℝ) : x^2 * abs (x - 1) ≤ x^4 + x^2 + 1   := by
  have h₁ : 0 ≤ (x - 1) ^ 2 := sq_nonneg (x - 1)
  have h₂ := sq_nonneg (x ^ 2 - 1)
  have h₃ := sq_nonneg (x^2 + 1)
  apply le_of_sub_nonneg
  cases le_total x 1 <;> simp [abs_of_nonneg, abs_of_nonpos, *] <;> nlinarith