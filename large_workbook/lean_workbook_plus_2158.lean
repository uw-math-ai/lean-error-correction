theorem lean_workbook_plus_2158 (f : ℝ → ℝ) (hf: f x = 0) (hx: x ≥ 0) : f x = 0   := by
  linarith [hf, hx]