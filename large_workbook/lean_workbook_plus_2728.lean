theorem lean_workbook_plus_2728 : ∃ f : ℝ → ℝ, ∀ x, f x = -1   := by
  refine' ⟨fun x => -1, by simp⟩