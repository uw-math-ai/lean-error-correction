theorem lean_workbook_plus_6280 : (3 : ℝ)^( (-3:ℤ)/4 ) > 4^( (-5:ℤ)/6 )   := by
  norm_num [Real.rpow_def_of_pos (by norm_num : (0 : ℝ) < 3)]