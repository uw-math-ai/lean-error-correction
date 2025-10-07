theorem lean_workbook_plus_50  (p : ℝ)
  (h₀ : p = 0.5 / 5.5) :
  p = 1 / 11   := by
  norm_num [h₀]