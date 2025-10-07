theorem lean_workbook_plus_5785 : a ≤ b → ∀ ε : ℝ, ε > 0 → a ≤ b + ε   := by
  exact fun h ε ε_pos ↦ by linarith