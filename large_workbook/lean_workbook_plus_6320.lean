theorem lean_workbook_plus_6320 :
  ∀ a b c : ℝ, a > 0 ∧ b > 0 ∧ c > 0 → a + b > c ∧ a + c > b ∧ b + c > a → a^2 * (a - b) * (a - c) + b^2 * (b - a) * (b - c) + c^2 * (c - a) * (c - b) ≥ 0   := by
  intro a b c h₁ h₂
  simp [h₁.1, h₁.2.1, h₁.2.2, h₂.1, h₂.2.1, h₂.2.2]
  have h₃ : 0 ≤ (a - b)^2 + (a - c)^2 + (b - c)^2 := by nlinarith
  nlinarith [sq_nonneg (a + b - c), sq_nonneg (a + c - b), sq_nonneg (b + c - a)]