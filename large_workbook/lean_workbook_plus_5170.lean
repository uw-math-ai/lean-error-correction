theorem lean_workbook_plus_5170 (x : ℝ): (x-1)^(1/3) + (2*x-1)^(1/3) > (3*x+1)^(1/3)   := by
  norm_num [Real.rpow_def_of_pos (by norm_num : (0 : ℝ) < 3)]