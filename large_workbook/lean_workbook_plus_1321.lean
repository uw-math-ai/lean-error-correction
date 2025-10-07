theorem lean_workbook_plus_1321  (f : ℝ → ℝ)
  (h₀ : StrictAnti f)
  (h₁ : f 0 = 1)
  (h₂ : f 1 = 0)
  : ∀ x ∈ Set.Ioo 0 1, 0 < f x ∧ f x < 1   := by
  intro x hx
  constructor <;> linarith [h₀ hx.1, h₀ hx.2, h₁, h₂]