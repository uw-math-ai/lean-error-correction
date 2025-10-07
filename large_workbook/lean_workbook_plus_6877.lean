theorem lean_workbook_plus_6877  (a b : ℝ)
  (n : ℕ)
  (u : ℕ → ℝ)
  (h₀ : u 0 = a * b)
  (h₁ : ∀ n, u (n + 1) = (1 + u n) / 2) :
  u n = 1 + (a * b - 1) / 2 ^ n   := by
  induction n <;> simp_all [h₁, pow_succ, mul_add, mul_comm, mul_left_comm]
  ring