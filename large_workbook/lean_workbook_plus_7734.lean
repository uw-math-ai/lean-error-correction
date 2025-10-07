theorem lean_workbook_plus_7734 : 2013 > (2012!)^(1/2012)   := by
  norm_num [Real.sqrt_eq_iff_sq_eq]