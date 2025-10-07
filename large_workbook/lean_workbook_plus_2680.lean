theorem lean_workbook_plus_2680 (b c : ℝ) (h₁ : 0 < b ∧ 0 < c) (h₂ : b ≤ 1 ∧ c ≤ 1) : 2 * b * c + 1 ≥ b + c   := by
  nlinarith [h₁.1, h₁.2, h₂.1, h₂.2]