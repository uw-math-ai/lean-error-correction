theorem lean_workbook_plus_8645 (x y : ℤ) (h₁ : x^2 - 1 = 3 * y^2) : ∃ x y : ℤ, x^2 - 1 = 3 * y^2 ∧ y ≠ 0   := by
  refine' ⟨2, 1, _, _⟩ <;> norm_num