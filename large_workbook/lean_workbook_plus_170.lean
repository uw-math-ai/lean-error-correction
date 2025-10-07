theorem lean_workbook_plus_170 {a b c s : ℝ} (hs : s = (a + b + c) / 2) : (a * b + b * c + c * a) / 4 ≥ (s - b) * (s - c) + (s - a) * (s - b) + (s - c) * (s - a)   := by
  simp [hs, mul_add, add_mul, mul_comm, mul_left_comm]
  nlinarith [sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)]