theorem lean_workbook_plus_232 (a b : ℝ) (ha : 0 < a) (hb : 0 < b) (hab : a * b + 1 / (a * b) = 6) : (a + 1) * (b + 1) ≥ 2   := by
  field_simp [mul_add, add_mul, mul_comm, mul_left_comm] at hab ⊢
  nlinarith [sq_nonneg (a - b), sq_nonneg (a - 1), sq_nonneg (b - 1)]