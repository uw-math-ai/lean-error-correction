theorem lean_workbook_plus_4277 : 1 ≥ sin A * sin B - cos A * cos B   := by
  have := sq_nonneg (sin A - sin B)
  rw [sub_sq] at this
  nlinarith [sin_sq_add_cos_sq A, sin_sq_add_cos_sq B]