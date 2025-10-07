theorem lean_workbook_plus_6462 (a b : ℝ) (h1 : 0 ≤ a ∧ 0 ≤ b) (h2 : a ≤ b) (h3 : b ≤ 1) : a * b^2 - a^2 * b ≤ 1 / 4   := by
  have h4 := sq_nonneg (b - 1/2)
  have h5 := sq_nonneg (a - b / 2)
  nlinarith [h1.1, h1.2, h2, h3, h4, h5]