theorem lean_workbook_plus_4699  (a b c x : ℝ)
  (h₀ : a ≠ 0)
  (h₁ : a * x^2 + b * x + c = 0) :
  x^2 + b / a * x + c / a = 0   := by
  field_simp [h₀] at h₁ ⊢
  linarith [h₀, h₁]