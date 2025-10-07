theorem lean_workbook_plus_356  (n x a : ℝ)
  (h₀ : n = 2)
  (h₁ : a = (9 - 2 * n) / (6 * n))
  (h₂ : x = n + a) :
  x = 29 / 12   := by
  norm_num [h₀, h₁, h₂]