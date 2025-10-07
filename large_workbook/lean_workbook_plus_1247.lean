theorem lean_workbook_plus_1247 :
  (7 : ℝ) = 10^Real.logb 10 7   := by
  norm_num [Real.logb_eq_iff_rpow_eq (by norm_num : (0 : ℝ) < 10)]