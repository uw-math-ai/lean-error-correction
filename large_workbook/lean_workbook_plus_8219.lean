theorem lean_workbook_plus_8219 : ∃ f : ℝ → ℝ, ∀ x, f x = x^2   := by
  refine' ⟨fun x => x^2, fun x => rfl⟩