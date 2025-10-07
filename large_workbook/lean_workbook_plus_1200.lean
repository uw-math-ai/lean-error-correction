theorem lean_workbook_plus_1200 : ∃ f : ℝ → ℝ, ∀ x, f x = 0   := by
  refine' ⟨fun x ↦ 0, fun x ↦ rfl⟩