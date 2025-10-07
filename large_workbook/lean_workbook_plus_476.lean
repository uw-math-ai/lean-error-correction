theorem lean_workbook_plus_476 : (a+1)*(a-1) = a^2 - 1   := by
  induction a <;> simp [*, pow_succ, mul_add, mul_comm, mul_left_comm]
  simp [Nat.succ_eq_add_one, mul_add, mul_comm, mul_left_comm]