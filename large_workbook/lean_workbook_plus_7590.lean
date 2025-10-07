theorem lean_workbook_plus_7590 (f : ℝ → ℝ) (a : ℝ) (hf: f x = a + x) : (2 * f x - 3 * x + a = 2 * a - 2 * x + f x)   := by
  linarith [hf]