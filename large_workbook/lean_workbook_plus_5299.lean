theorem lean_workbook_plus_5299 (a b : ℝ) : tanh (a+b) = (tanh a + tanh b) / (1 + tanh a * tanh b)   := by
  simp [tanh_eq_sinh_div_cosh, sinh_add, cosh_add, add_mul, mul_add, mul_comm, mul_left_comm]
  field_simp <;> ring