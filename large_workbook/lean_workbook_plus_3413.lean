theorem lean_workbook_plus_3413 : ∀ x : ℕ, choose x 2 = (x^2 - x) / 2   := by
  refine' fun x => (Nat.choose_two_right x).trans _
  simp [sq, tsub_mul, mul_tsub, mul_comm, mul_assoc, mul_left_comm]