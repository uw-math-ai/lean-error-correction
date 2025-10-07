theorem lean_workbook_plus_250 (k : ℝ) (f : ℝ → ℝ) (hf: f = fun x ↦ k * x) : f x = k * x   := by
  rw [hf]