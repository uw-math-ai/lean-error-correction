theorem lean_workbook_plus_8000 (α : ℝ) : Real.cos (2 * α) = 2 * (Real.cos α)^2 - 1   := by
  simp [Real.cos_two_mul, sq]