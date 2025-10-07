theorem lean_workbook_plus_9662 (x : ℝ) : 7 - x^2 = 23 - 5 * x^2 ↔ x = 2 ∨ x = -2   := by
  simp [sub_eq_add_neg, add_comm]
  exact ⟨fun h ↦ by
  simp [sq] at h
  apply eq_or_eq_neg_of_sq_eq_sq _ 2
  linarith, fun h ↦ by
  rcases h with (rfl | rfl) <;> ring⟩