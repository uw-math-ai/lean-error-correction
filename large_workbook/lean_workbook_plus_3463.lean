theorem lean_workbook_plus_3463 :
  (3^33 + 77) % 100 = 0   := by
  norm_num [pow_succ, pow_zero, pow_one, Nat.add_mod, Nat.mul_mod, Nat.mod_mod]