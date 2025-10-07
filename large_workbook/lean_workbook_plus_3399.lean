theorem lean_workbook_plus_3399 : 7^7 * 7^7 > (3^3 * 4^4)^3   := by
  norm_num [pow_succ, pow_succ, pow_succ, pow_succ, pow_succ, pow_succ, pow_succ]