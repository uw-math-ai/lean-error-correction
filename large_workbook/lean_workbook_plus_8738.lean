theorem lean_workbook_plus_8738 (y₁ y₂ : ℝ) (h₁ : y₁ ^ 3 + y₁ = y₂ ^ 3 + y₂) : y₁ = y₂   := by
  nlinarith [sq_nonneg (y₁ - y₂), sq_nonneg (y₁ ^ 2 - y₂ ^ 2)]