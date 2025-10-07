theorem lean_workbook_plus_9468 : 6 ^ 2016 ≡ 1 [ZMOD 43]   := by
  norm_num [pow_succ, pow_mul, pow_one, Int.ModEq]