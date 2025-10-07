theorem lean_workbook_plus_4987  (u v w a b c : ℝ)
  (h₀ : 0 ≤ u ∧ 0 ≤ v ∧ 0 ≤ w)
  (h₁ : 0 ≤ a ∧ 0 ≤ b ∧ 0 ≤ c)
  (h₂ : a = u)
  (h₃ : b = u + v)
  (h₄ : c = u + v + w)
  (h₅ : 3 * u^4 + 8 * u^3 * v + 4 * u^3 * w + 12 * u^2 * v^2 + 12 * u^2 * v * w + 6 * u^2 * w^2 + 8 * u * v^3 + 12 * u * v^2 * w + 12 * u * v * w^2 + 4 * u * w^3 + 2 * v^4 + 4 * v^3 * w + 6 * v^2 * w^2 + 4 * v * w^3 + w^4 ≥ 3 * u^4 + 8 * u^3 * v + 4 * u^3 * w + 7 * u^2 * v^2 + 7 * u^2 * v * w + u^2 * w^2 + 2 * u * v^3 + 3 * u * v^2 * w + u * v * w^2) :
  u^2 * v^2 + u^2 * v * w + u^2 * w^2 + 6 * u * v^3 + 9 * u * v^2 * w + 11 * u * v * w^2 + 4 * u * w^3 + 2 * v^4 + 4 * v^3 * w + 6 * v^2 * w^2 + 4 * v * w^3 + w^4 ≥ 0   := by
  have h₆ : 0 ≤ u := h₀.1
  have h₇ := h₀.2.2
  have h₈ : 0 ≤ v := by linarith
  positivity