theorem lean_workbook_plus_7819  (x y z : ℝ)
  (h₀ : x + y + z = 0)
  (h₁ : x = (b + c) / a)
  (h₂ : y = (c + a) / b)
  (h₃ : z = (a + b) / c)
  (h₄ : 0 < a ∧ 0 < b ∧ 0 < c)
  (h₅ : a + b + c = 1) :
  x * y * z = 2 ∧ x * y * (x + y) = -2   := by
  field_simp [h₀, h₁, h₂, h₃, h₄.1.ne', h₄.2.1.ne', h₄.2.2.ne'] at h₀ h₁ h₂ h₃ ⊢
  exact ⟨by nlinarith [h₀, h₁, h₂, h₃, h₄.1, h₄.2.1, h₄.2.2, h₅], by nlinarith [h₀, h₁, h₂, h₃, h₄.1, h₄.2.1, h₄.2.2, h₅]⟩