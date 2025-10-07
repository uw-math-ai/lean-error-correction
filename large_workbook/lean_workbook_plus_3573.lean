theorem lean_workbook_plus_3573  (a r : ℝ)
  (n : ℕ)
  (h₀ : a = -1)
  (h₁ : r = 1)
  (h₂ : n = 0)
  (h₃ : ∑' n : ℕ, (a * r^n + 1) = 0) :
  ∑' n : ℕ, (a * r^n + 1) = 0   := by
  simp [h₀, h₁, h₂, h₃]