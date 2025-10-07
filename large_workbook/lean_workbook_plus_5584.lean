theorem lean_workbook_plus_5584 : ∃ y, y = ∑' n : ℕ, (-1 : ℝ)^n * (exp 2)^n / (2 * n)!   := by
  refine' ⟨∑' n : ℕ, (-1 : ℝ)^n * (Real.exp 2)^n / (2 * n)!, by simp⟩