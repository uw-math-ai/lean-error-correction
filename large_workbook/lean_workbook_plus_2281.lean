theorem lean_workbook_plus_2281 (a b : ℝ) (h₁ : b ≥ a) : b^3 - 12*b + 16 ≥ a^3 - 12*a - 16   := by
  have h₂ := sq_nonneg (b - a)
  have h₃ := sq_nonneg (b + a)
  have h₄ := sq_nonneg (b - 4)
  nlinarith [sq_nonneg (b - 4 - a)]