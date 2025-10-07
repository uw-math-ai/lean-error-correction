theorem lean_workbook_plus_1400 (a : ℝ) (ha : a ≤ 0) : ∀ x : ℝ, ∃ y : ℝ, y = a * x ^ 2   := by
  exact fun x ↦ ⟨a * x ^ 2, by simp [ha]⟩