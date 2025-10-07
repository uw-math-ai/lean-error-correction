theorem lean_workbook_plus_4832 : ∀ y : ℝ, cos y ^ 2 = (cos (2 * y) + 1) / 2   := by
  exact fun y ↦ by rw [cos_two_mul, add_comm]; ring