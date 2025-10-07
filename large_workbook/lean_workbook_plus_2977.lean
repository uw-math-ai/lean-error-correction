theorem lean_workbook_plus_2977  (h : ℝ)
  (h₀ : h - 2 * h / 3 = 666) :
  h = 1998   := by
  linarith [h₀]