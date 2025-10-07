theorem lean_workbook_plus_950 (k : ℝ) (h₁ : k > 0) (h₂ : k^3 / 4 = 7 * k / 3) : k = Real.sqrt (28 / 3)   := by
  have h₃ : k ≠ 0 := by linarith
  have h₄ : k^2 = 28 / 3 := by nlinarith [sq_nonneg (k - √(28 / 3)), h₂]
  rw [← Real.sqrt_sq (le_of_lt h₁), h₄]