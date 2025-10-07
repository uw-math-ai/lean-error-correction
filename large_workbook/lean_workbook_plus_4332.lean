theorem lean_workbook_plus_4332  (x y : ℝ)
  (h₀ : x + y = 7)
  (h₁ : x^2 - y^2 = 21) :
  x = 5 ∧ y = 2   := by
  exact ⟨by nlinarith [h₀, h₁], by nlinarith [h₀, h₁]⟩