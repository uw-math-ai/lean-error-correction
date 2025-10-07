theorem lean_workbook_plus_1895  (a b : ℝ)
  (h₀ : 0 < a ∧ 0 < b)
  (h₁ : a^2 + 2 * b ≥ a^2 + 2 * a + 1) :
  2 * b ≥ 2 * a + 1   := by
  linarith [sq_nonneg (a - 1), h₀.1, h₀.2, h₁]