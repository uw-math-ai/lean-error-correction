theorem lean_workbook_plus_6317 : ∀ x : ℝ, x^8 - x^7 + x^6 + x^5 - x^3 - x^2 + 1 ≥ 0   := by
  intro x
  simp [sq, mul_add, add_mul, mul_comm, mul_left_comm]
  nlinarith [sq_nonneg (x ^ 4 - x ^ 2), sq_nonneg (x ^ 2 - x), sq_nonneg (x ^ 4 + x ^ 2 - 1)]