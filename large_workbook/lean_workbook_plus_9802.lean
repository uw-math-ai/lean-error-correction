theorem lean_workbook_plus_9802 (n : ℕ) : fib n ^ 2 + fib (n + 1) ^ 2 = fib (2 * n + 1)   := by
  simp [fib_add_two, fib_two_mul, fib_two_mul_add_one]
  ring