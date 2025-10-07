theorem lean_workbook_plus_4901  (m r s : ℂ)
  (f : ℂ → ℂ)
  (h₀ : ∀ x, f x = x^2 - (4 * m + 1) * x + 4 * m^2)
  (h₁ : f r = 0)
  (h₂ : f s = 0)
  (h₃ : r ≠ s) :
  r + s = 4 * m + 1 ∧ r * s = 4 * m^2   := by
  simp [h₀, h₁, h₂] at h₁ h₂
  have h₄ : r - s ≠ 0 := mt sub_eq_zero.mp h₃
  exact ⟨by apply (mul_right_inj' h₄).mp; linear_combination h₁ - h₂,
  by apply (mul_right_inj' h₄).mp; linear_combination h₁ * s - h₂ * r⟩