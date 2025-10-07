theorem lean_workbook_plus_6680 (g : ℝ → ℝ) (h : ∀ x, g (g (g x)) = x^2 + 3*x + 4) : ∃ v, g (g 2) = v   := by
  refine' ⟨g (g 2), rfl⟩