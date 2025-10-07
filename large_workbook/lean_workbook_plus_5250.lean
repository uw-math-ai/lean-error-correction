theorem lean_workbook_plus_5250 (a x : ℝ) : Real.sin (a + x) - Real.sin (a - x) = 2 * Real.cos a * Real.sin x   := by
  simp [sin_add, sin_sub, cos_sub]
  ring