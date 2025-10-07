theorem lean_workbook_plus_1993 (α β : ℝ) (h₁ : β = Real.sqrt ((Real.exp α + π) / (Real.exp α - π))) : β = Real.sqrt ((Real.exp α + π) / (Real.exp α - π))   := by
  simp [h₁]