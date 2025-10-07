theorem lean_workbook_plus_189 (f : ℝ → ℝ) (hf: ∀ a v w : ℝ, f (a * v) = a * f v ∧ f (v + w) = f v + f w) : ∃ c :ℝ, ∀ x : ℝ, f x = c * x   := by
  refine' ⟨f 1, fun x ↦ _⟩
  have h₁ := hf x 1 0
  simpa [h₁.1, h₁.2, mul_comm] using h₁.1