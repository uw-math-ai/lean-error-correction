theorem lean_workbook_plus_6413 : ∀ a b c : ℝ, (a + b + c) ^ 2 ≤ 3 * (a ^ 2 + b ^ 2 + c ^ 2)   := by
  exact fun a b c ↦ by linarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]