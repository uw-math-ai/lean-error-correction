theorem lean_workbook_plus_3724 : ∀ n : ℕ, (1 + x)^n ≥ 1 + n*x   := by
  intro n
  induction n <;> simp [*, pow_succ, add_mul, mul_add, mul_comm, mul_left_comm]
  nlinarith [sq_nonneg (x + 1), sq_nonneg x]