theorem lean_workbook_plus_8730 (a b : ℝ) (n : ℕ) : (a + b) ^ n = ∑ j in Finset.range (n + 1), choose n j * a ^ (n - j) * b ^ j   := by
  rw [add_comm]
  simp [add_mul, mul_add, mul_comm, mul_left_comm, pow_add, pow_mul]
  simp only [add_pow, add_mul, mul_pow, mul_assoc, mul_comm, mul_left_comm]