theorem lean_workbook_plus_5454 (f : ℝ → ℝ) (g : ℝ → ℝ) (hf: f = g + id) (hg: Continuous g) (h2g: g 2*x = g x) : ∃ c, f x = x + c   := by
  exact ⟨g x, by simp [hf, h2g, add_comm]⟩