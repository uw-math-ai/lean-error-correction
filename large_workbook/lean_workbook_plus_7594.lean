theorem lean_workbook_plus_7594 (p : ℤ → ℤ) (a b n : ℤ) (hp : ∀ x : ℤ, p x = x^2 + a * x + b) : ∃ M : ℤ, p n * p (n + 1) = p M   := by
  use n^2 + (a + 1) * n + b
  simp [hp, mul_add, add_mul, add_assoc, add_comm, add_left_comm]
  ring