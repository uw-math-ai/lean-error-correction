theorem lean_workbook_plus_7810 (a b c d : ℝ) (h1 : a > 0 ∧ b > 0 ∧ c > 0 ∧ d > 0 ∧ a + b + c + d = 1) :
  a * b + b * c + c * d ≤ 1 / 4   := by
  nlinarith [sq_nonneg (a - b + c - d), h1.1, h1.2.1, h1.2.2.1, h1.2.2.2]