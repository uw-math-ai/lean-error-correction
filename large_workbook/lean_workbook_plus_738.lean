theorem lean_workbook_plus_738  (r : ℝ)
  (h₀ : Real.log 5 = r * Real.log 2) :
  r = Real.logb 2 5   := by
  field_simp [Real.logb, h₀]