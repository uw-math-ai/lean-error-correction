theorem lean_workbook_plus_8603 (a b c : ℝ) (f : ℝ → ℝ) (h : ∀ x, f x = a * x ^ 2 + b * x + c) : ∀ x, f (x + 3) - 3 * f (x + 2) + 3 * f (x + 1) - f x = 0   := by
  exact fun x ↦ by norm_num [h]; ring