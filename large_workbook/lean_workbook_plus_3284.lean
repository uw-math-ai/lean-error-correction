theorem lean_workbook_plus_3284 (f : ℝ → ℝ) (c : ℝ) (h : ∀ x, f x = c) : ∀ x, f x = c   := by
  exact fun x ↦ h x