theorem lean_workbook_plus_9135 (f s : ℝ) : (5 * f / 6 = 3 * s / 4) → f = 9 * s / 10   := by
  exact fun h ↦ by linarith [h]