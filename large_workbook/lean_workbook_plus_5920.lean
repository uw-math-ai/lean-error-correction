theorem lean_workbook_plus_5920 (c d ψ₁ ψ₂ : ℝ) : ψ₁^2 * c^2 + ψ₂^2 * d^2 ≥ -2 * c * d * ψ₁ * ψ₂   := by
  nlinarith [sq_nonneg (ψ₁ * c + ψ₂ * d), sq_nonneg (ψ₁ * c - ψ₂ * d)]