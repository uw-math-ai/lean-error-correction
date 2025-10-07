theorem lean_workbook_plus_941 (f : ℤ → ℤ) (hf: f = fun n => 2 - n) : ∀ n, f n = 2 - n   := by
  exact fun n ↦ by simp [hf]