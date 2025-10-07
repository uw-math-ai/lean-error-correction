theorem lean_workbook_plus_6524 (a b : ℝ) (h1 : 3 ≤ a ^ 2 + b ^ 2 + a * b) (h2 : a ^ 2 + b ^ 2 + a * b ≤ 6) : 2 ≤ a ^ 4 + b ^ 4 ∧ a ^ 4 + b ^ 4 ≤ 72   := by
  refine' ⟨_, _⟩
  nlinarith [sq_nonneg (a^2 - 1), sq_nonneg (b^2 - 1)]
  nlinarith [sq_nonneg (a + b), sq_nonneg (a - b)]