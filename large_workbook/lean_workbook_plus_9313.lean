theorem lean_workbook_plus_9313 (a b : ℝ) (B : ℝ) : a^2 + b^2 - 2 * a * b * Real.cos (B + 60) = a^2 + b^2 - 2 * a * b * Real.cos (360 - (180 - B) - 120)   := by
  ring_nf