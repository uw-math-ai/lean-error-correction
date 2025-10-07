theorem lean_workbook_plus_1079 : (6 * Real.sqrt 5)^(1/3) = (180)^(1/6)   := by
  norm_num [Real.sqrt_eq_iff_sq_eq]