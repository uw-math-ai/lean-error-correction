theorem lean_workbook_plus_4642 :
  32 * 1296 * 126 = 5225472   := by
  norm_num [Nat.mul_comm, Nat.mul_assoc, Nat.mul_left_comm]