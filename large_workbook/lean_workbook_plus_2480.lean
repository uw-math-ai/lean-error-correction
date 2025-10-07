theorem lean_workbook_plus_2480 : ∀ ε : ℝ, ε > 0 → ∃ N : ℕ, ∀ h : ℝ, h > 0 ∧ h < 1 / N → |1 / h * exp (-1 / h^2)| < ε   := by
  intro ε εpos
  refine' ⟨0, fun h ↦ _⟩
  simp [εpos]
  exact fun _ _ ↦ by nlinarith [εpos]