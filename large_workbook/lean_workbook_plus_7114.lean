theorem lean_workbook_plus_7114 : ∃ f : ℝ → ℝ, ∀ x, f x = x   := by
  refine' ⟨fun x => x, fun x => rfl⟩