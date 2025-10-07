theorem lean_workbook_plus_3909 (x : ℂ) : x ^ 2 - 64 = 0 ↔ x = 8 ∨ x = -8   := by
  simp [sub_eq_zero]
  exact ⟨fun h ↦ by apply eq_or_eq_neg_of_sq_eq_sq _ 8; rw [h]; norm_num, fun h ↦ by rcases h with (rfl | rfl) <;> ring⟩