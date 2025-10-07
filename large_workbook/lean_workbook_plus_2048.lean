theorem lean_workbook_plus_2048 : (2:ℝ)^(Real.logb 2 5 - 2) = (2:ℝ)^(Real.logb 2 5) / (2:ℝ)^2   := by
  rw [Real.rpow_sub two_pos, Real.rpow_two]