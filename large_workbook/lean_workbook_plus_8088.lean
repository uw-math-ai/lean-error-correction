theorem lean_workbook_plus_8088 :
  6^3 = 3^3 + 4^3 + 5^3 → 6^3 - 5^3 = 3^3 + 4^3 → (6 / 5)^3 - 1 = (3 / 5)^3 + (4 / 5)^3   := by
  norm_num [div_eq_mul_inv, mul_comm, mul_assoc, mul_left_comm]