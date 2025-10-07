theorem lean_workbook_plus_631 (b A : ℝ) : b^2 - b^2 * Real.sin A * Real.sin A = b^2 * (Real.cos A)^2   := by
  nlinarith [Real.sin_sq_add_cos_sq A]