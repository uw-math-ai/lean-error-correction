theorem lean_workbook_plus_9312 (x y : ℝ) : (4 / 3) ≥ (0.5 * x ^ 2 * y)^(1 / 3)   := by
  norm_num [Real.rpow_def_of_pos (by norm_num : (0 : ℝ) < 3)]