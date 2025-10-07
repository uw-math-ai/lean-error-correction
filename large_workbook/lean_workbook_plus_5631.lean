theorem lean_workbook_plus_5631 (a b : ℝ) : cos (a + b) = cos a * cos b - sin a * sin b   := by
  simp [cos_add, sin_add, cos_sub, sin_sub]