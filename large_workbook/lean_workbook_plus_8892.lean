theorem lean_workbook_plus_8892 (f : ℝ → ℝ) (β : ℝ) (h : ∀ x, f x ≥ β) : ∀ x, f x ≥ β   := by
  exact fun x ↦ h x