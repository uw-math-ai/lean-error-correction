theorem lean_workbook_plus_4043 : 2 * Real.sqrt 6 + 5 = 10 → 5 + Real.sqrt 6 < 10   := by
  exact fun h ↦ by linarith [h]