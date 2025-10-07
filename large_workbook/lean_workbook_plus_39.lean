theorem lean_workbook_plus_39 :
  ∑' n : ℕ, (1 / 2) * ((1 / 4)^n) = 2 / 3   := by
  simp [div_eq_mul_inv, mul_comm, mul_assoc, mul_left_comm]