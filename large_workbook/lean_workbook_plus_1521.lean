theorem lean_workbook_plus_1521 : 21 ^ 20 ≡ 1 [ZMOD 100]   := by
  norm_num [pow_succ, pow_zero, pow_one, Int.ModEq]