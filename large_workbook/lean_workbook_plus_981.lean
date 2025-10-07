theorem lean_workbook_plus_981 : 2 ^ 29 - 2 ^ 15 + 1 ≡ 0 [ZMOD 5]   := by
  norm_num [pow_succ, pow_zero, pow_one, Int.ModEq]