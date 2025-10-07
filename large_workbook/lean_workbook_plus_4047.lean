theorem lean_workbook_plus_4047  (x y : ℝ)
  (h₀ : x = 12)
  (h₁ : y = 10)
  (h₂ : y = 1 / 5 * x + b)
  (h₃ : b = 38 / 5) :
  y = 1 / 5 * x + b   := by
  linarith [h₀, h₁, h₂, h₃]