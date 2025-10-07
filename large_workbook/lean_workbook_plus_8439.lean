theorem lean_workbook_plus_8439  (m : ℕ)
  (f : ℕ → ℕ)
  (h₀ : ∀ m, f (m + 1) = f m + m + 1)
  (h₁ : f 1 = 1) :
  f m = m * (m + 1) / 2   := by
  induction m <;> simp_all [Nat.succ_eq_add_one, h₀, h₁, mul_add, add_mul, add_assoc, add_comm, add_left_comm]
  omega