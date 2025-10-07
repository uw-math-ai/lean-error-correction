theorem lean_workbook_plus_7839  (a b c a' b' c' : ℝ)
  (f g : ℝ → ℝ)
  (h₀ : ∀ x, f x = a * x ^ 2 + b * x + c)
  (h₁ : ∀ x, g x = a' * x ^ 2 + b' * x + c')
  (h₂ : ∀ x, f x = g x) :
  a = a' ∧ b = b' ∧ c = c'   := by
  refine ⟨?_,?_,?_⟩
  all_goals linarith [h₀ 0, h₁ 0, h₂ 0, h₀ 1, h₁ 1, h₂ 1, h₀ (-1), h₁ (-1), h₂ (-1)]