theorem lean_workbook_plus_4398 (x y : ℝ) (h₁ : 5*x+5*y+2*x*y=-19) (h₂ : x+y+3*x*y=-35) : x = -3 ∧ y = 4 ∨ x = 4 ∧ y = -3   := by
  have h₃ : (x + 3) * (y + 3) = 0 := by linarith
  have h₄ : x + 3 = 0 ∨ y + 3 = 0 := eq_zero_or_eq_zero_of_mul_eq_zero h₃
  cases' h₄ with h₄ h₄
  exacts [Or.inl ⟨by linarith, by linarith⟩, Or.inr ⟨by linarith, by linarith⟩]