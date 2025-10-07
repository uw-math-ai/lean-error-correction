theorem lean_workbook_plus_8160 : ∃ f g : ℝ → ℝ, ∀ x, f x = -x ∧ g x = -x   := by
  refine' ⟨fun x ↦ -x, fun x ↦ -x, fun x ↦ ⟨rfl, rfl⟩⟩