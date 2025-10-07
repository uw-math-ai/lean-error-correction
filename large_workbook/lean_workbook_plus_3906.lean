theorem lean_workbook_plus_3906 (b : ℝ) : ∃ x y z : ℝ, y = b ∧ x = (-1/2 * z^2 + (3 * b + 1) / 2)   := by
  refine' ⟨-1/2 * b^2 + (3 * b + 1) / 2, b, b, rfl, rfl⟩