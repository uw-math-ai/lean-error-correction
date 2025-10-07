theorem lean_workbook_plus_9467  (f : ℝ → ℝ)
  (h₀ : ∀ x, f x = x^5 + 6 * x^4 + 7 * x^3 - 20 * x^2 - 42 * x - 20)
  (h₁ : f 2 = 0) :
  ∀ x, f x = (x - 2) * (x + 1)^2 * (x^2 + 6 * x + 10)   := by
  exact fun x ↦ by simp [h₀, h₁]; ring