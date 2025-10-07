theorem lean_workbook_plus_3114 (f : ℝ → ℝ) (f_of : 0 ≤ x ∧ x < 5 → f x = -2 * x + 3) (f_on : 5 ≤ x ∧ x ≤ 10 → f x = -3 * x + 8) : 0 ≤ x ∧ x ≤ 10 → ∃ y, y = f x   := by
  refine' fun h => ⟨f x, rfl⟩