theorem lean_workbook_plus_8289 : 7 ^ 12 ≡ 1 [ZMOD 130]   := by
  norm_num [pow_succ, pow_zero, pow_one, Int.ModEq]