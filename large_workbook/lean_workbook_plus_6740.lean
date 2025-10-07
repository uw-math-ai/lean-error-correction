theorem lean_workbook_plus_6740 (x : ℝ) : sin (x + 2 * π) = sin x   := by
  simp [sin_add, sin_two_mul]