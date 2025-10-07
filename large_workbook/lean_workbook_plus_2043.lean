theorem lean_workbook_plus_2043 : 56^6053 ≡ 56^53 [MOD 1000]   := by
  norm_num [pow_succ, pow_mul, pow_one, Nat.ModEq]