theorem lean_workbook_plus_5023 : ∀ x : ℝ, cos x ^ 2 + sin x ^ 2 = cos x ^ 2 + sin x ^ 2   := by
  exact fun x ↦ by simp [cos_sq_add_sin_sq]