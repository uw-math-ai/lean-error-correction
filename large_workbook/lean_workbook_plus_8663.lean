theorem lean_workbook_plus_8663 (x₀ y₀ : ℝ) (h : y₀ = k * x₀) (h' : b^2 * x₀^2 + a^2 * y₀^2 = a^2 * b^2) : (b^2 + a^2 * k^2) * x₀^2 - a^2 * b^2 = 0   := by
  rw [h, sq, sq] at h' <;> linarith