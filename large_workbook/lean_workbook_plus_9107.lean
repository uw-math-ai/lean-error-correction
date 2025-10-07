theorem lean_workbook_plus_9107 : ∀ x y : ℝ, (x + y) ^ 4 - 8 * x * y * (x + y) ^ 2 + 16 * x ^ 2 * y ^ 2 ≥ 0   := by
  exact fun x y ↦ by nlinarith [sq_nonneg (x + y), sq_nonneg (x - y)]