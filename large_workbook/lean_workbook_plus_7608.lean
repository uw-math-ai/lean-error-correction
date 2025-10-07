theorem lean_workbook_plus_7608 : Real.logb 6 2 + Real.logb 6 3 = 1   := by
  rw [← Real.logb_mul (by norm_num : (2 : ℝ) ≠ 0) (by norm_num : (3 : ℝ) ≠ 0)]
  norm_num [Real.logb]