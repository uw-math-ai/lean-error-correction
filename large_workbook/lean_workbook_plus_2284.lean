theorem lean_workbook_plus_2284 (f : ℝ → ℝ) (hf: f x = 0) (hx: x = 0) : f x = 0 ↔ x = 0   := by
  rw [hf, hx]