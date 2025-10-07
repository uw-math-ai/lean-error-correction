theorem lean_workbook_plus_7473 (h₁ : 900 = 2 * 2 * 9 * 5 * 5) : true   := by
  simp only [h₁, Nat.mul_comm, Nat.mul_assoc, Nat.mul_left_comm]