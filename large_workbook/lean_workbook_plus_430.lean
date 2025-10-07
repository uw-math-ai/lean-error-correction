theorem lean_workbook_plus_430 (n : ℕ) : (fib (n + 2))^2 - fib (n + 1) * fib (n + 2) - (fib (n + 1))^2 = (-1 : ℤ)^(n + 1)   := by
  simp [fib_add_two, pow_add, mul_add, mul_comm, mul_left_comm]
  induction n <;> simp [fib_add_two, pow_succ, *]
  linarith