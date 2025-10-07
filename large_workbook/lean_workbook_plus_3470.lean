theorem lean_workbook_plus_3470  (x y : ℝ)
  (f : ℝ → ℝ)
  (h₀ : ∀ z, f z = 3 * (z - 3)^2 + 7 * (z - 3) + 4)
  (h₁ : y = f x) :
  y = 3 * x^2 - 11 * x + 10   := by
  linarith [h₀ x, h₁]