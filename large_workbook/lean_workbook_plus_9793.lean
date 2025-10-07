theorem lean_workbook_plus_9793 (a b c d : ℝ) : Real.sqrt ((a ^ 2 + b ^ 2) * (c ^ 2 + d ^ 2)) ≥ a * c + b * d   := by
  apply Real.le_sqrt_of_sq_le
  linarith [sq_nonneg (a * d - b * c)]