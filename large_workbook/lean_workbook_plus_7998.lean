theorem lean_workbook_plus_7998 (h₁ : 15 * 87 = 1305) : 15 * 87 = 1305   := by
  simp only [h₁, Nat.mul_comm, Nat.mul_left_comm, Nat.mul_assoc]