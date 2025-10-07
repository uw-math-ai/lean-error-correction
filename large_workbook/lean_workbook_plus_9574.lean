theorem lean_workbook_plus_9574 : ∀ n : ℕ, |(-1 : ℝ)^((n*(n+3))/2)/n| = 1/n   := by
  exact fun n ↦ by simp [abs_div, abs_pow]