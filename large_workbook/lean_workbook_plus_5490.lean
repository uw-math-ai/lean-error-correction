theorem lean_workbook_plus_5490 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a^5 - b^3 ≥ 2 * a) : a^3 ≥ 2 * b   := by
  have h₁ : 0 < a^2 := pow_pos ha 2
  have h₂ : 0 < b^2 := pow_pos hb 2
  have h₃ : 0 < a^2 * b^2 := mul_pos h₁ h₂
  have h₄ : 0 < a * b := mul_pos ha hb
  nlinarith [sq_nonneg (a^2 - b^2), sq_nonneg (a^2 + b^2)]