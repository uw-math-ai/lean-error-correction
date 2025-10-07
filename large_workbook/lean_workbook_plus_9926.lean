theorem lean_workbook_plus_9926 (f : ℝ → ℝ) (hf : ∀ x ≠ 0, 3 * f (1 / x) + (2 * f x) / x = x^2) : f (-2) = 67 / 20   := by
  have h₁ := hf (-2) (by norm_num)
  have h₂ := hf (-1 / 2) (by norm_num)
  norm_num at h₁ h₂ <;> linarith