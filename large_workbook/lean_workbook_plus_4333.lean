theorem lean_workbook_plus_4333 : 2 ^ 8731 ≡ 0 [ZMOD 8]   := by
  norm_num [pow_succ, pow_mul, pow_one, Int.ModEq]