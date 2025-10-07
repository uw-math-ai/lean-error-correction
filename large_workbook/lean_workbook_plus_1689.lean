theorem lean_workbook_plus_1689 : ∀ a b c : ℝ, a^2 + b^2 + c^2 = 1 → (a - b)^2 + (b - c)^2 + (c - a)^2 ≤ 3   := by
  exact fun a b c h ↦ by linarith [sq_nonneg (a + b + c), h]