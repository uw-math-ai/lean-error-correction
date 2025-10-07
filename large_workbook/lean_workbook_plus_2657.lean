theorem lean_workbook_plus_2657 (x y : ℝ) (h : 2 * (x ^ 2 + y ^ 2) / (x ^ 2 + y ^ 2) = 2) : x = x ∧ y = y   := by
  exact ⟨rfl, rfl⟩