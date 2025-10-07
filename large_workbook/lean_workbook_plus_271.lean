theorem lean_workbook_plus_271 (x y : ℝ) : (1 - 8 * Real.sin x * Real.sin y * Real.cos (x + y)) = (2 * Real.cos (x + y) - Real.cos (x - y)) ^ 2 + Real.sin (x - y) ^ 2   := by
  simp [sub_sq, cos_add, cos_sub, sin_add, sin_sub]
  nlinarith [sin_sq_add_cos_sq x, sin_sq_add_cos_sq y]