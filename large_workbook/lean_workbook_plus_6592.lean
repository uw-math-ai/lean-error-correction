theorem lean_workbook_plus_6592 (f : ℝ → ℝ): f '' Set.univ = {0} → ∀ x, f x = 0   := by
  exact fun h x ↦ by rw [← Set.mem_singleton_iff, ← h]; simp