theorem lean_workbook_plus_1896 (f : ℕ → ℕ) (hf: f 1 = 1) (hf1: ∀ m n: ℕ, f (m + n) = f m + f n + m * n): ∀ n:ℕ, f n = n * (n + 1) / 2   := by
  intro n
  induction n <;> simp_all [hf1, Nat.succ_eq_add_one, add_assoc, mul_add, add_mul]
  linarith [hf1 0 0, hf1 0 1]
  omega