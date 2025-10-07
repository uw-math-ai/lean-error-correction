theorem lean_workbook_plus_5943 (f : ℕ → ℝ) (k : ℕ) (h₁ : f k = 2 ^ k * k / ((k + 1) * (k + 2))) : f k = 2 ^ k * k / ((k + 1) * (k + 2))   := by
  exact h₁