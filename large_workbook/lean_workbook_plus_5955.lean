theorem lean_workbook_plus_5955 : 31 ∣ 5^31 + 5^17 + 1   := by
  norm_num [Nat.pow_succ, Nat.pow_zero, Nat.pow_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]