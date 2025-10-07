theorem lean_workbook_plus_2150  (q : ℝ)
  (f : ℝ → ℝ)
  (h₀ : ∀ x, f x = x^2 + 2 * x + q)
  (h₁ : ∃ x, f x = 0) :
  q ≤ 1   := by
  rcases h₁ with ⟨x, h₁⟩
  nlinarith [sq_nonneg x, sq_nonneg (x + 1), h₀ x, h₀ (x + 1), h₁]