theorem lean_workbook_plus_1881 (a b : ℝ) (hab : a > 0 ∧ b > 0) (h : a + b = a^2 + b^2) : a + b ≤ a^2 + b^2   := by
  linarith [sq_nonneg (a - b), hab.1, hab.2]