theorem lean_workbook_plus_3904  (x y z : ℝ)
  (f : ℕ → ℝ)
  (h₀ : ∀ a, f a = a^2 * x + (a + 1)^2 * y + (a + 2)^2 * z)
  (h₁ : f 1 = 305)
  (h₂ : f 2 = 319)
  (h₃ : f 3 = 880) :
  f 4 = 1988   := by
  simp [h₀] at h₁ h₂ h₃ ⊢
  linarith [h₀ 0, h₀ 1, h₀ 2, h₀ 3, h₀ 4]