theorem lean_workbook_plus_3407  (a b c p q : ℝ)
  (h₀ : a + b + c = p)
  (h₁ : a * b + b * c + c * a = q)
  (h₂ : 8 * (p^2 - 2 * q) * q ≤ p^4) :
  16 * q^2 - 8 * p^2 * q + p^4 ≥ 0   := by
  nlinarith [h₀, h₁, h₂]