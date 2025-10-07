theorem lean_workbook_plus_6007  (x : ℕ)
  (n : ℕ)
  (h₀ : n = x + 19) :
  n * (n + 1) * (n + 2) * (n + 3) = (n^2 + 3 * n + 1)^2 - 1   := by
  simp [h₀, sq, mul_add, add_mul, mul_comm, mul_left_comm]
  ring