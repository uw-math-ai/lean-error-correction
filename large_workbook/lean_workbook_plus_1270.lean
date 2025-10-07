theorem lean_workbook_plus_1270 : ∃ f : ℝ → ℝ, ∀ x, f x = 1 ∨ f x = x^3   := by
  refine' ⟨fun x => 1, by simp⟩