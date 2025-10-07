theorem lean_workbook_plus_2376 (x d r t : ℝ) : d = r * t ∧ d = 15 * (3 - x) ∧ d = 3 * x → x = 2.5   := by
  rintro ⟨h₁, h₂, h₃⟩
  ring_nf at h₁ h₂ h₃ ⊢
  linarith [h₁, h₂, h₃]