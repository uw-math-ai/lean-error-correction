theorem lean_workbook_plus_5573 (f : ℕ → ℕ) (f_def : ∀ n, f n = n^2 + 2*n + 1) : f 10 = 121   := by
  simp only [f_def, Nat.pow_succ, Nat.pow_zero, Nat.mul_one, Nat.add_zero]