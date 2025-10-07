theorem lean_workbook_plus_8917 (A B : ℝ) : sin (A + B) = sin A * cos B + cos A * sin B   := by
  simp [Real.sin_add, Real.cos_add, add_mul, mul_add, mul_comm, mul_left_comm]