theorem lean_workbook_plus_6148 : ∀ x : ℚ, x^2 + x - 1 ≠ 0 → ∃ y : ℚ, x = (y^3 + 2*y^2 - (y^2 + y)) / (y^2 + y - 1)   := by
  refine' fun x hx => ⟨x, by field_simp; ring⟩