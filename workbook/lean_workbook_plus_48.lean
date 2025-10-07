theorem lean_workbook_plus_48 :
  1 - (25 : ℝ) / 64 = 39 / 64   := by
  norm_num [show (1 : ℝ) - 25 / 64 = 39 / 64 by norm_num]