theorem lean_workbook_plus_1852 (a : ℝ) (f : ℝ → ℝ) (hf: f = fun x ↦ x^2 + a) : (∀ x, f x = x^2 + a)   := by
  exact fun x ↦ by simp [hf]