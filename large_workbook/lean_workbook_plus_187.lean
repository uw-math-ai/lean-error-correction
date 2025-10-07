theorem lean_workbook_plus_187 (x : ℝ) (hx : x = (4 - 2 * Real.sqrt 3) / 2) : x = 2 - Real.sqrt 3   := by
  linarith [hx]