theorem lean_workbook_plus_3891 (hx: 2^32+1 = 641*6700417): 2^32+1 = 641*6700417   := by
  simp only [hx, Nat.mul_comm, Nat.mul_assoc, Nat.mul_left_comm]