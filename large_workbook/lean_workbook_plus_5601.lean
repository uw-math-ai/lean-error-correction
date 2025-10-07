theorem lean_workbook_plus_5601 (t : ℝ) : t^2 - 7*t + 10 = 0 ↔ t = 2 ∨ t = 5   := by
  simp [sub_eq_add_neg, add_comm, add_left_comm]
  simp [sq, sub_eq_add_neg, add_comm, add_left_comm]
  exact ⟨fun h ↦ by
  have h1 : (t - 2) * (t - 5) = 0 := by linarith
  simp [sub_eq_zero] at h1
  exact h1, fun h ↦ by cases' h with h h <;> rw [h] <;> ring⟩