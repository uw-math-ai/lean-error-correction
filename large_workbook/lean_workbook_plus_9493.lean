theorem lean_workbook_plus_9493 (f : ℝ → ℝ): (∀ x, f (2 * x) = f x + x) ∧ (∀ x, f (x - f (2 * x)) + x = 0) → ∀ x, f (-f x) = -x   := by
  simp (config := { contextual := true }) [add_comm, sub_eq_add_neg]
  exact fun h₁ h₂ x => by linarith [h₁ x, h₂ x]