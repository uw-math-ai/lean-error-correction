theorem lean_workbook_plus_7240 : ∀ x y : ℝ, sin x * sin y = 1 / 2 * (cos (x - y) - cos (x + y))   := by
  exact fun x y ↦ by rw [cos_add, cos_sub]; ring