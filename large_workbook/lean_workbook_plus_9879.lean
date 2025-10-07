theorem lean_workbook_plus_9879  (x : ℝ)
  (u : ℝ)
  (h₀ : 0 ≤ 2 * x + 19)
  (h₁ : u = Real.sqrt (2 * x + 19))
  (h₂ : 2 * u^2 - 14 * u + 21 = 0) :
  u^2 - 7 * u + 21 / 2 = 0   := by
  nlinarith [h₀, h₁, h₂]