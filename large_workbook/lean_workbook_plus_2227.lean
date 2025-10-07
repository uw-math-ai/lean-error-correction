theorem lean_workbook_plus_2227 (f : ℝ → ℝ) (hf: f = fun x => -Real.exp (x / 2018)) : (∀ x, f x = -Real.exp (x / 2018))   := by
  exact fun x ↦ by rw [hf]