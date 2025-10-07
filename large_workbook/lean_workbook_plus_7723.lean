theorem lean_workbook_plus_7723 (m : ℕ) : (Nat.choose (2*m) m)^2 = (Nat.choose (2*m) m) * (Nat.choose (2*m) m)   := by
  simp [sq, mul_assoc, mul_comm, mul_left_comm]