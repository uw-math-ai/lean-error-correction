theorem lean_workbook_plus_8957 (a b c k : ℝ) (h₁ : k = a + b + c) (h₂ : a + b + c ≠ 0) : a / k + b / k + c / k = 1   := by
  field_simp [h₁, h₂]