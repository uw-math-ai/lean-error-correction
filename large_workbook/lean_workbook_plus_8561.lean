theorem lean_workbook_plus_8561  (p : ℝ)
  (h₀ : 100 * p = 1 + 1 - p + 10 - 10 * p) :
  p = 4 / 37   := by
  linarith [h₀]