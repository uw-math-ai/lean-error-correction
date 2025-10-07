theorem lean_workbook_plus_5016  (x y : ℝ)
  (h₀ : 8 * x^3 + 1 = 3 * y)
  (h₁ : y^3 = 6 * x - 1) :
  8 * x^3 - y^3 = 3 * y - 6 * x → y = 2 * x   := by
  intro h₂
  have h₃ : 8 * x ^ 3 + 1 = 3 * y := h₀
  have h₄ : 8 * x ^ 3 - y ^ 3 = 3 * y - 6 * x := h₂
  have h₅ : 8 * x ^ 3 + 1 = 3 * y := h₀
  have h₆ : 8 * x ^ 3 - y ^ 3 = 3 * y - 6 * x := h₂
  nlinarith [sq_nonneg (2 * x - y), sq_nonneg (2 * x + y)]