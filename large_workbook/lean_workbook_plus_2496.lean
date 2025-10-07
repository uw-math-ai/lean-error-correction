theorem lean_workbook_plus_2496 (f : ℝ → ℝ) (hf: f (x^2+1) = (f x)^2+1 ∧ f 0 = 0) : ∃ f : ℝ → ℝ, f (x^2+1) = (f x)^2+1 ∧ f 0 = 0   := by
  exact ⟨f, hf⟩