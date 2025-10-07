theorem lean_workbook_plus_9856 :
  (1 / 4 * (23 + Real.sqrt 513)) * (1 / 4 * (23 - Real.sqrt 513)) = 1   := by
  ring_nf
  norm_num [Real.sqrt_eq_iff_sq_eq]