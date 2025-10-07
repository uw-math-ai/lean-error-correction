theorem lean_workbook_plus_6627  (x y : ℝ)
  (h₀ : 0 < x ∧ 0 < y)
  (h₁ : 3 * x + 3 * y = 120)
  (h₂ : x + y = 40) :
  x * y ≤ 400   := by
  nlinarith [sq_nonneg (x - y), h₀.1, h₀.2, h₁, h₂]