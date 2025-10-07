theorem lean_workbook_plus_9901 (n x : ℝ) (h₁ : n * x < 1) : 1 - n * x > 0   := by
  linarith [h₁]