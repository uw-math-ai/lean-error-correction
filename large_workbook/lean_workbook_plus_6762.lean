theorem lean_workbook_plus_6762 (f : ℕ → ℕ) (h : ∀ n, f n = 1) : ∀ n, f n = 1   := by
  exact fun n ↦ h n