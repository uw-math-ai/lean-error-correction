theorem lean_workbook_plus_9439 {r p : ℝ} : (∃ q, 2 * r + p = q) ∧ (∃ q, r ^ 2 + 2 * r * p = q) ∧ (∃ q, r ^ 2 * p = q) → ∃ q, r = q ∧ ∃ q, p = q   := by
  simp [add_comm]