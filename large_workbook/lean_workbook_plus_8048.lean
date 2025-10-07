theorem lean_workbook_plus_8048  (x : ℝ)
  (h₀ : 0 ≤ 5 - x^2) :
  Real.sqrt (5 - x^2) ≤ Real.sqrt 5   := by
  apply Real.sqrt_le_sqrt <;> nlinarith [h₀]