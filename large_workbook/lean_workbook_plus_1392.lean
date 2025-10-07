theorem lean_workbook_plus_1392 (y : ℝ) (x : ℕ → ℝ) : (∃ x₁ x₂ x₃ x₄ x₅ : ℝ, x₅ + x₂ = y * x₁ ∧ x₁ + x₃ = y * x₂ ∧ x₂ + x₄ = y * x₃ ∧ x₃ + x₅ = y * x₄ ∧ x₄ + x₁ = y * x₅) ↔ (∃ x : ℝ, 2 * x = y)   := by
  refine' ⟨_, _⟩
  all_goals aesop
  exacts [⟨y / 2, by linarith⟩, ⟨0, 0, 0, 0, 0, by norm_num⟩]